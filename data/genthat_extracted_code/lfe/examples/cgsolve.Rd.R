library(lfe)


### Name: cgsolve
### Title: Solve a symmetric linear system with the conjugate gradient
###   method
### Aliases: cgsolve

### ** Examples


  N <- 100000
# create some factors
  f1 <- factor(sample(34000,N,replace=TRUE))
  f2 <- factor(sample(25000,N,replace=TRUE))
# a matrix of dummies, which probably is rank deficient
  B <- makeDmatrix(list(f1,f2))
  dim(B)
# create a right hand side
  b <- as.matrix(B %*% rnorm(ncol(B)))
# solve B' B x = B' b
  sol <- cgsolve(crossprod(B), crossprod(B, b), eps=-1e-2)
  #verify solution
  sqrt(sum((B %*% sol - b)^2))




