library(SuperGauss)


### Name: SuperGauss
### Title: Superfast inference for stationary Gaussian time series.
### Aliases: SuperGauss SuperGauss-package

### ** Examples

# Superfast inference for the timescale parameter of
# the exponential autocorrelation function
exp.acf <- function(lambda) exp(-(1:N-1)/lambda)

# simulate data
lambda0 <- 1
N <- 1000
X <- rSnorm(n = 1, acf = exp.acf(lambda0))

# loglikelihood function
Toep <- Toeplitz(n = N) # allocate memory for a Toeplitz matrix object
loglik <- function(lambda) {
  Toep$setAcf(acf = exp.acf(lambda))
  dSnorm(X = X, acf = Toep, log = TRUE)
}

# maximum likelihood estimation
optimize(f = loglik, interval = c(.2, 5), maximum = TRUE)



