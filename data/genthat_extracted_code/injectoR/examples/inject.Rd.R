library(injectoR)


### Name: inject
### Title: Injects the callback function
### Aliases: inject

### ** Examples

inject (function (two) two, define (two = function () 2, binder = binder ()))
inject (function (power) power (2, 4), 
        define (power = function (power) function (x, n) if (n < 1) 1 else x * power (x, n - 1)))
inject (function (fibonacci) fibonacci (8),
        define (fibonacci = function (fibonacci)
          function (n) if (n < 3) 1
                       else fibonacci (n - 1) + fibonacci (n - 2), binder = binder ()))



