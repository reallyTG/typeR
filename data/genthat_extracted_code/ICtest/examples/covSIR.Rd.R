library(ICtest)


### Name: covSIR
### Title: Supervised Scatter Matrix as Used in Sliced Inverse Regression
### Aliases: covSIR
### Keywords: multivariate

### ** Examples

X <- matrix(rnorm(1000), ncol = 5)
eps <- rnorm(200, sd = 0.1)
y <- 2 + 0.5 * X[, 1] + 2 * X[, 3] + eps

covSIR(X, y)



