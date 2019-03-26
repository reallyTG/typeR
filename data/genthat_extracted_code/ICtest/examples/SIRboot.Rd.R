library(ICtest)


### Name: SIRboot
### Title: Testing the Subspace Dimension for Sliced Inverse Regression
###   Using Bootstrapping.
### Aliases: SIRboot
### Keywords: multivariate htest

### ** Examples

X <- matrix(rnorm(1000), ncol = 5)
eps <- rnorm(200, sd = 0.1)
y <- 2 + 0.5 * X[, 1] + 2 * X[, 3] + eps
  
SIRboot(X, y, k = 0) 
SIRboot(X, y, k = 1)    



