library(LaplacesDemon)


### Name: dist.LASSO
### Title: LASSO Distribution
### Aliases: dlasso rlasso
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- rnorm(100)
sigma <- rhalfcauchy(1, 5)
tau <- rhalfcauchy(100, 5)
lambda <- rhalfcauchy(1, 5)
x <- dlasso(x, sigma, tau, lambda, log=TRUE)
x <- rlasso(length(tau), sigma, tau, lambda)



