library(esaddle)


### Name: demvn
### Title: Evaluate the density of a multivariate Gaussian fit
### Aliases: demvn

### ** Examples

library(esaddle)
X <- matrix(rnorm(2 * 1e3), 1e3, 2) # Sample used to fit a multivariate Gaussian
demvn(rnorm(2), X, log = TRUE)      # Evaluate the fitted log-density at a random location



