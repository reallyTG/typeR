library(rriskDistributions)


### Name: get.weibull.par
### Title: Fitting parameters of a Weibull distribution from two or more
###   quantiles
### Aliases: get.weibull.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qweibull(p = c(0.025, 0.5, 0.975), shape = 0.01, scale = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.weibull.par(q = q, scaleX = c(0.1, 0.03))
get.weibull.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.1, 0.99))
get.weibull.par(q = q, fit.weights = c(10, 1, 10))
get.weibull.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.1, 0.03))
get.weibull.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.1, 0.03))
graphics::par(old.par)

q <- stats::qweibull(p = c(0.025, 0.5, 0.975), shape = 0.1, scale = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.weibull.par(q = q, scaleX = c(0.1, 0.05))
get.weibull.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.00000001, 0.99999999999))
get.weibull.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.00000001, 0.99999999999))
get.weibull.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.00000001, 0.01))
get.weibull.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.00000001, 0.1))
graphics::par(old.par)

q <- stats::qweibull(p = c(0.025, 0.5, 0.975), shape = 2, scale = 3)
old.par <- graphics::par(mfrow = c(2, 3))
get.weibull.par(q = q)
get.weibull.par(q = q, fit.weights = c(100, 1, 100))
get.weibull.par(q = q, fit.weights = c(10, 1, 10))
get.weibull.par(q = q, fit.weights = c(1, 100, 1))
get.weibull.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qweibull(p = c(0.025, 0.5, 0.975), shape = 1, scale = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.weibull.par(q = q)
get.weibull.par(q = q, fit.weights = c(100, 1, 100))
get.weibull.par(q = q, fit.weights = c(10, 1, 10))
get.weibull.par(q = q, fit.weights = c(1, 100, 1))
get.weibull.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qweibull(p = c(0.025, 0.975), shape = 2, scale = 1)
old.par <- graphics::par(mfrow = c(1, 3))
get.weibull.par(p = c(0.025, 0.975), q = q)
get.weibull.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.weibull.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
graphics::par(old.par)




