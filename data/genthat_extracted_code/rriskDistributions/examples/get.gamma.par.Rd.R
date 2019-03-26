library(rriskDistributions)


### Name: get.gamma.par
### Title: Fitting parameters of a gamma distribution from two or more
###   quantiles
### Aliases: get.gamma.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qgamma(p = c(0.025, 0.5, 0.975), shape = 10, rate = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.gamma.par(q = q)
get.gamma.par(q = q, scaleX = c(0.00001, 0.9999))
get.gamma.par(q = q, fit.weights = c(100, 1, 100))
get.gamma.par(q = q, fit.weights = c(10, 1, 10))
get.gamma.par(q = q, fit.weights = c(1, 100, 1))
get.gamma.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qgamma(p = c(0.025, 0.5, 0.975), shape = 0.1, rate = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.gamma.par(q = q)
get.gamma.par(q = q, fit.weights = c(100, 1, 100))
get.gamma.par(q = q, fit.weights = c(10, 1, 10))
get.gamma.par(q = q, fit.weights = c(1, 100, 1))
get.gamma.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qgamma(p = c(0.025, 0.5, 0.975), shape = 1, rate = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.gamma.par(q = q)
get.gamma.par(q = q, fit.weights = c(100, 1, 100))
get.gamma.par(q = q, fit.weights = c(10, 1, 10))
get.gamma.par(q = q, fit.weights = c(1, 100, 1))
get.gamma.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qgamma(p = c(0.025, 0.975), shape = 10, rate = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.gamma.par(p = c(0.025, 0.975), q = q)
get.gamma.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.gamma.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100))
get.gamma.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.gamma.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
graphics::par(old.par)




