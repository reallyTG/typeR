library(rriskDistributions)


### Name: get.exp.par
### Title: Fitting parameters of an exponential distribution from one or
###   more quantiles
### Aliases: get.exp.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qexp(p = c(0.025, 0.5, 0.975), rate = 2)
old.par <- graphics::par(mfrow = c(2, 3))
get.exp.par(q = q)
get.exp.par(q = q, fit.weights = c(100, 1, 100))
get.exp.par(q = q, fit.weights = c(10, 1, 10))
get.exp.par(q = q, fit.weights = c(1, 100, 1))
get.exp.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qexp(p = c(0.025, 0.5, 0.975), rate = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.exp.par(q = q)
get.exp.par(q = q, fit.weights = c(100, 1, 100))
get.exp.par(q = q, fit.weights = c(10, 1, 10))
get.exp.par(q = q, fit.weights = c(1, 100, 1))
get.exp.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qexp(p = c(0.025, 0.5, 0.975), rate = 0.001)
old.par <- graphics::par(mfrow = c(2, 3))
get.exp.par(q = q)
get.exp.par(q = q, fit.weights = c(100, 1, 100))
get.exp.par(q = q, fit.weights = c(10, 1, 10))
get.exp.par(q = q, fit.weights = c(1, 100, 1))
get.exp.par(q = q, tol = 0.2, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qexp(p = c(0.025, 0.5, 0.975), rate = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.exp.par(q = q)
get.exp.par(q = q, fit.weights = c(100, 1, 100))
get.exp.par(q = q, fit.weights = c(10, 1, 10))
get.exp.par(q = q, fit.weights = c(1, 100, 1))
get.exp.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only one quantile
q <- stats::qexp(p = c(0.025), rate = 2)
old.par <- graphics::par(mfrow = c(1, 3))
get.exp.par(p = c(0.025), q = q)
get.exp.par(p = c(0.025), q = q, fit.weights = 10)
get.exp.par(p = c(0.025), q = q, fit.weights = 100)
graphics::par(old.par)




