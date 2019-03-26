library(rriskDistributions)


### Name: get.logis.par
### Title: Fitting parameters of a logistic distribution from two or more
###   quantiles
### Aliases: get.logis.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qlogis(p = c(0.025, 0.5, 0.975), location = 0, scale = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.logis.par(q = q)
get.logis.par(q = q, scaleX = c(0.5, 0.5))
get.logis.par(q = q, fit.weights = c(100, 1, 100))
get.logis.par(q = q, fit.weights = c(10, 1, 10))
get.logis.par(q = q, fit.weights = c(1, 100, 1))
get.logis.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qlogis(p = c(0.025, 0.5, 0.975), location = 0, scale = 3)
old.par <- graphics::par(mfrow = c(2, 3))
get.logis.par(q = q)
get.logis.par(q = q, fit.weights = c(100, 1, 100))
get.logis.par(q = q, fit.weights = c(10, 1, 10))
get.logis.par(q = q, fit.weights = c(1, 100, 1))
get.logis.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qlogis(p = c(0.025, 0.975), location = 0, scale = 3)
old.par <- graphics::par(mfrow = c(1, 3))
get.logis.par(p = c(0.025, 0.975), q = q)
get.logis.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.logis.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
graphics::par(old.par)




