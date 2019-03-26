library(gsubfn)


### Name: match.funfn
### Title: Generic extended version of R match.fun
### Aliases: match.funfn
### Keywords: programming

### ** Examples

# return first argument evaluated at second argument squared.
sq <- function(f, x) {
   f <- match.funfn(f)
   f(x^2)
}

# call sq using different forms for function
sq(function(x) exp(x)/x, pi)
f <- function(x) exp(x)/x
sq("f", pi)
sq(~ exp(x)/x, pi)
sq(x ~ exp(x)/x, pi)




