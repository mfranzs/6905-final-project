;; ===================
;; Printable strings
;; ===================

(load "load.scm")
(load "main.scm")

(define printable-string? string?)
(register-predicate! printable-string?)
(register-super! string? printable-string?)

;; ===================
;; Predicates for record types
;; ===================

;(defined-typed-record-type
 ; 'person '(first-name? last-name? age?))(st

;; ===================
;; Example: Printing a person
;; ===================

(define-record-type Person
  (make-person first-name last-name age)
  person?
  (first-name person:first-name)
  (last-name person:last-name)
  (age person:age))

(define person:first-name? printable-string?)
(define person:last-name? printable-string?)
(define person:age? number?)

(write-line "!")
(write-line person?)

(register-type-transform! person? person:first-name?
			       person:first-name)
(register-type-transform! person? person:last-name?
			       person:last-name)
(register-type-transform! person? person:age?
			       person:age)

(write-line "A")

(define-record-type FullName
  (make-full-name first-name last-name)
  full-name?
  (first-name full-name:first-name)
  (last-name full-name:last-name))

(define gs (make-person "Gerald" "Sussman" 18))
(write-line gs)
(write-line (person:first-name gs))

(write-line "??")
((create-compound-transformation (car(get-transformations person?
							  string?))) gs)

