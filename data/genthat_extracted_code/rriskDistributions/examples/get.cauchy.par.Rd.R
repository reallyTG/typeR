library(rriskDistributions)


### Name: get.cauchy.par
### Title: Fitting parameters of a Cauchy distribution from two or more
###   quantiles
### Aliases: get.cauchy.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qcauchy(p = c(0.025, 0.5, 0.975), location = 0, scale = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.cauchy.par(q = q)
get.cauchy.par(q = q, scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.5, 0.5))
graphics::par(old.par)

q <- stats::qcauchy(p = c(0.025, 0.5, 0.975), location = 3, scale = 5)
old.par <- graphics::par(mfrow = c(2, 3))
get.cauchy.par(q = q, scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.5, 0.5))
graphics::par(old.par)

q <- stats::qcauchy(p = c(0.025, 0.5, 0.975), location = 0.1, scale = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.cauchy.par(q = q, scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.5, 0.5))
get.cauchy.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.5, 0.5))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qcauchy(p = c(0.025, 0.975), location = 0.1, scale = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.cauchy.par(p = c(0.025, 0.975), q = q, scaleX = c(0.5, 0.5))
get.cauchy.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1), scaleX = c(0.5, 0.5))
get.cauchy.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10), scaleX = c(0.5, 0.5))
get.cauchy.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100), scaleX = c(0.5, 0.5))
graphics::par(old.par)




