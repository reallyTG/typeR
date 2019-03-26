library(rriskDistributions)


### Name: get.beta.par
### Title: Fitting parameters of a Beta distribution from two or more
###   quantiles
### Aliases: get.beta.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qbeta(p = c(0.025, 0.5, 0.975), shape1 = 2, shape2 = 3)
old.par <- graphics::par(mfrow = c(2, 3))
get.beta.par(q = q)
get.beta.par(q = q, scaleX = c(0.001, 0.999))
get.beta.par(q = q, fit.weights = c(10, 1, 10))
get.beta.par(q = q, fit.weights = c(1, 10, 1))
get.beta.par(q = q, fit.weights = c(100, 1, 100))
get.beta.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qbeta(p = c(0.025, 0.5, 0.975), shape1 = 1, shape2 = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.beta.par(q = q)
get.beta.par(q = q, fit.weights = c(10, 1, 10))
get.beta.par(q = q, fit.weights = c(1, 10, 1))
get.beta.par(q = q, fit.weights = c(100, 1, 100))
get.beta.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qbeta(p = c(0.025, 0.5, 0.975), shape1 = 0.3, shape2 = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.beta.par(q = q)
get.beta.par(q = q, fit.weights = c(10, 1, 10))
get.beta.par(q = q, fit.weights = c(1, 10, 1))
get.beta.par(q = q, fit.weights = c(100, 1, 100))
get.beta.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qbeta(p = c(0.025, 0.975), shape1 = 2, shape2 = 3)
old.par <- graphics::par(mfrow = c(2, 3))
get.beta.par(p = c(0.025, 0.975), q = q)
get.beta.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.beta.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
get.beta.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.beta.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100))
graphics::par(old.par)




