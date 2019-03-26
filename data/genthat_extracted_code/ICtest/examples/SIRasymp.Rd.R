library(ICtest)


### Name: SIRasymp
### Title: Testing the Subspace Dimension for Sliced Inverse Regression.
### Aliases: SIRasymp
### Keywords: multivariate htest

### ** Examples

X <- matrix(rnorm(1000), ncol = 5)
eps <- rnorm(200, sd = 0.1)
y <- 2 + 0.5 * X[, 1] + 2 * X[, 3] + eps
  
SIRasymp(X, y, k = 0) 
SIRasymp(X, y, k = 1)    



