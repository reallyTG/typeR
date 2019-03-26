library(IMIFA)


### Name: is.posi_def
### Title: Check Postive-(Semi)definiteness of a matrix
### Aliases: is.posi_def
### Keywords: utility

### ** Examples

x    <- cov(matrix(rnorm(100), nrow=10, ncol=10))
is.posi_def(x)
is.posi_def(x, semi=TRUE)

Xnew <- is.posi_def(x, semi=FALSE, make=TRUE)$X.new
identical(x, Xnew)
identical(x, is.posi_def(x, semi=TRUE, make=TRUE)$X.new)



