library(gmp)


### Name: nextprime
### Title: Next Prime Number
### Aliases: nextprime
### Keywords: arith

### ** Examples

nextprime(14)
## still very fast:
(p <- nextprime(1e7))
## to be really sure { isprime()  gives "probably prime" } :
stopifnot(identical(p, factorize(p)))



