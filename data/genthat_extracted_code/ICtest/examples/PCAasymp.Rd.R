library(ICtest)


### Name: PCAasymp
### Title: Testing for Subsphericity using the Covariance Matrix or Tyler's
###   Shape Matrix
### Aliases: PCAasymp
### Keywords: htest multivariate

### ** Examples

n <- 200
X <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))

TestCov <- PCAasymp(X, k = 2)
TestCov
TestTyler <- PCAasymp(X, k = 1, scatter = "tyler")
TestTyler



