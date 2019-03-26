library(SuperGauss)


### Name: Snorm.grad
### Title: Gradient of the loglikelihood of a multivariate normal with
###   Toeplitz variance matrix.
### Aliases: Snorm.grad

### ** Examples

# two parameter inference
acf.fun <- function(theta) theta[2]^2 * exp(-theta[1]*(1:N-1))
mu.fun <- function(theta) theta[1]

# partial derivatives
dacf.fun <- function(theta) {
  ea <- exp(-theta[1]*(1:N-1))
  cbind(-theta[1]*theta[2]^2 * ea, 2*theta[2] * ea)
}
dmu.fun <- function(theta) c(1, 0)

# generate data
N <- 300
theta <- rexp(2)
X <- rSnorm(n = 1, acf = acf.fun(theta)) + mu.fun(theta)

# likelihood gradient
Snorm.grad(X = X, mu = mu.fun(theta), dmu = dmu.fun(theta),
           acf = acf.fun(theta), dacf = dacf.fun(theta))



