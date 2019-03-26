library(dlm)


### Name: dlmSvd2var
### Title: Compute a nonnegative definite matrix from its Singular Value
###   Decomposition
### Aliases: dlmSvd2var
### Keywords: array misc

### ** Examples

x <- matrix(rnorm(16),4,4)
x <- crossprod(x)
tmp <- La.svd(x)
all.equal(dlmSvd2var(tmp$u, sqrt(tmp$d)), x)
## Vectorized usage
x <- dlmFilter(Nile, dlmModPoly(1, dV=15099, dW=1469))
x$se <- sqrt(unlist(dlmSvd2var(x$U.C, x$D.C)))
## Level with 50% probability interval
plot(Nile, lty=2)
lines(dropFirst(x$m), col="blue")
lines(dropFirst(x$m - .67*x$se), lty=3, col="blue")
lines(dropFirst(x$m + .67*x$se), lty=3, col="blue")



