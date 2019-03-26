library(mgcv)


### Name: mroot
### Title: Smallest square root of matrix
### Aliases: mroot
### Keywords: models smooth regression

### ** Examples

  require(mgcv)
  set.seed(0)
  a <- matrix(runif(24),6,4)
  A <- a%*%t(a) ## A is +ve semi-definite, rank 4
  B <- mroot(A) ## default pivoted choleski method
  tol <- 100*.Machine$double.eps
  chol.err <- max(abs(A-B%*%t(B)));chol.err
  if (chol.err>tol) warning("mroot (chol) suspect")
  B <- mroot(A,method="svd") ## svd method
  svd.err <- max(abs(A-B%*%t(B)));svd.err
  if (svd.err>tol) warning("mroot (svd) suspect")  



