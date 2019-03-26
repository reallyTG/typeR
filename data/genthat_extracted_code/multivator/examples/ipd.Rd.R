library(multivator)


### Name: ipd
### Title: Positive definite matrices
### Aliases: ipd

### ** Examples

data(mtoys)
stopifnot(ipd(crossprod(matrix(rnorm(30),10))))
stopifnot(ipd(M(toy_mhp)))



