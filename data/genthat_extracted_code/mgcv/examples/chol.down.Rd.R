library(mgcv)


### Name: choldrop
### Title: Down date a Cholesky factor on dropping a row/col
### Aliases: choldrop
### Keywords: models smooth regression

### ** Examples

  require(mgcv)
  set.seed(0)
  n <- 6
  A <- crossprod(matrix(runif(n*n),n,n))
  R0 <- chol(A)
  k <- 3
  Rd <- choldrop(R0,k)
  range(Rd-chol(A[-k,-k]))
  Rd;chol(A[-k,-k])
  
  ## same but using lower triangular factor A = LL'
  L <- t(R0)
  Ld <- choldrop(L,k)
  range(Ld-t(chol(A[-k,-k])))
  Ld;t(chol(A[-k,-k]))



