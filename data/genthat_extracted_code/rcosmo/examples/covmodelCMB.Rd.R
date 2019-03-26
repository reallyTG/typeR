library(rcosmo)


### Name: covmodelCMB
### Title: Computes values of covariance functions
### Aliases: covmodelCMB

### ** Examples


## Compute Askey variogram at x = pi/4

1 - covmodelCMB(pi/4, cov.pars = c(1, pi), kappa = 3, cov.model = "askey" )

## Plot of the Askey covariance function

v1.f <- function(x, ...) {covmodelCMB(x, ...)}
curve( v1.f(x, cov.pars = c(1, 0.03), kappa = 3, cov.model = "askey"),
from = 0, to = 0.1, xlab = "distance", ylab = expression(cov(h)), lty = 2,
main = "covariance")




