(define intern
  (lambda (sym) (send sym (quote intern))))

(define substring
  (lambda (string to from) (send string (quote []) to from)))

(define null?
  (lambda (expr) (= expr ())))

(define >
  (lambda (x y) (send x (intern ">") y)))

(define <
  (lambda (x y) (send x (intern "<") y)))

(define =
  (lambda (x y) (send x (intern "==") y)))

(define and
  (lambda (x y) (if x (if y y #f) #f)))

(define or
  (lambda (x y) (if x x (if y y #f))))

(define not
  (lambda (expr) (if expr #f #t)))

(define car
  (lambda (lst) (send lst (quote first))))

(define cdr
  (lambda (lst) (send lst (quote rest))))

(define cadr
  (lambda (lst) (car (cdr lst))))

(define let
  (lambda (defs body)
    ((lambda ((map car defs)) (map ;; should we just eval the body?
			 (lambda (form) ((car form) (cdr form)))
			 body))
     (map cadr defs))))