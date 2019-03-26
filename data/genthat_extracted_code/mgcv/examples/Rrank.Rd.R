library(mgcv)


### Name: Rrank
### Title: Find rank of upper triangular matrix
### Aliases: Rrank
### Keywords: models smooth regression

### ** Examples

  set.seed(0)
  n <- 10;p <- 5
  X <- matrix(runif(n*(p-1)),n,p)
  qrx <- qr(X,LAPACK=TRUE)
  Rrank(qr.R(qrx))



