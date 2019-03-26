library(copula)


### Name: safeUroot
### Title: One-dimensional Root (Zero) Finding - Extra "Safety" for
###   Convenience
### Aliases: safeUroot
### Keywords: optimize

### ** Examples

f1 <- function(x) (121 - x^2)/(x^2+1)
f2 <- function(x) exp(-x)*(x - 12)

try(uniroot(f1, c(0,10)))
try(uniroot(f2, c(0,2)))
##--> error: f() .. end points not of opposite sign

## where as safeUroot() simply first enlarges the search interval:
safeUroot(f1, c(0,10),trace=1)
safeUroot(f2, c(0,2), trace=2)

## no way to find a zero of a positive function:
try( safeUroot(exp, c(0,2), trace=TRUE) )

## Convergence checking :
safeUroot(sinc, c(0,5), maxiter=4) #-> "just" a warning
try( # an error, now with  check.conv=TRUE
  safeUroot(sinc, c(0,5), maxiter=4, check.conv=TRUE) )



