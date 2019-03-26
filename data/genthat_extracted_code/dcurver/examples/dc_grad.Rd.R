library(dcurver)


### Name: dc_grad
### Title: Gradient of the log-likelihood of univariate Davidian curves
### Aliases: dc_grad

### ** Examples

# The loglikelihood of a univariate Davidian curve is given by,
dc_LL <- function(phi, dat) {
  sum(log(ddc(dat, phi)))
}

# dc_grad can be used for obtaining the gradient of this loglikelihood as follows:
dc_LL_GR <- function(phi, dat) {
  colSums(dc_grad(dat, phi))
}

# This can be verified by numerical approximation.
# For instance, using numDeriv package:
## Not run: 
##D phi <- c(-5, 2.5, 10)
##D d <- runif(10, -5, 5)
##D dc_LL_GR(phi, d)
##D numDeriv::grad(dc_LL, x = phi, dat = d)
##D 
##D phi <- c(-5, 0, 10)
##D dc_LL_GR(phi, d)
## End(Not run)




