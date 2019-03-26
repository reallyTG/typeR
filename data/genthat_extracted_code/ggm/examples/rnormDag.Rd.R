library(ggm)


### Name: rnormDag
### Title: Random sample from a decomposable Gaussian model
### Aliases: rnormDag
### Keywords: distribution multivariate

### ** Examples

## Generate a sample of 100 observation from a multivariate normal
## The matrix of the path coefficients 
A <- matrix(
c(1, -2, -3,  0, 0,  0,  0,
  0,  1,  0, -4, 0,  0,  0,
  0,  0,  1,  2, 0,  0,  0,
  0,  0,  0,  1, 1, -5,  0,
  0,  0,  0,  0, 1,  0,  3,
  0,  0,  0,  0, 0,  1, -4,
  0,  0,  0,  0, 0,  0,  1), 7, 7, byrow=TRUE)
D <- rep(1, 7)
X <- rnormDag(100, A, D)

## The true covariance matrix
solve(A) %*% diag(D) %*% t(solve(A))

## Triangular decomposition of the sample covariance matrix
triDec(cov(X))$A



