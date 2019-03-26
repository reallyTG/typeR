library(SuperGauss)


### Name: Snorm.hess
### Title: Hessian of the loglikelihood of a multivariate normal with
###   Toeplitz variance matrix.
### Aliases: Snorm.hess

### ** Examples

# two parameter inference
acf.fun <- function(theta) theta[2]^2 * exp(-(1:N-1))
mu.fun <- function(theta) theta[1] * (1:N) + log(theta[2] + 1:N)

# partial derivatives
dacf.fun <- function(theta) {
  cbind(0, 2*theta[2] * exp(-(1:N-1)))
}
dmu.fun <- function(theta) cbind(1:N, 1/(theta[2] + 1:N))

# 2nd order partials
d2acf.fun <- function(theta) {
  H <- array(0, dim = c(N, 2, 2))
  H[,2,2] <- 2*exp(-(1:N-1))
  H
}
d2mu.fun <- function(theta) {
  H <- array(0, dim = c(N, 2, 2))
  H[,2,2] <- -1/(theta[2] + 1:N)^2
  H
}

# generate data
N <- 300
theta <- rexp(2)
X <- rSnorm(n = 1, acf = acf.fun(theta)) + mu.fun(theta)

# likelihood Hessian
Snorm.hess(X = X, mu = mu.fun(theta), acf = acf.fun(theta),
           dmu = dmu.fun(theta), dacf = dacf.fun(theta),
           d2mu = d2mu.fun(theta), d2acf = d2acf.fun(theta))



