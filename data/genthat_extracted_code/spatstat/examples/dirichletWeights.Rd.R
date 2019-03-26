library(spatstat)


### Name: dirichletWeights
### Title: Compute Quadrature Weights Based on Dirichlet Tessellation
### Aliases: dirichletWeights
### Keywords: spatial utilities

### ** Examples

  Q <- quadscheme(runifpoispp(10))
  X <- as.ppp(Q) # data and dummy points together
  w <- dirichletWeights(X, exact=FALSE)



