library(rriskDistributions)


### Name: get.t.par
### Title: Fitting parameter of a Student's t distribution from one or more
###   quantiles
### Aliases: get.t.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qt(p = c(0.025, 0.5, 0.975), df = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.t.par(q = q)
get.t.par(q = q, fit.weights = c(100, 1, 100))
get.t.par(q = q, fit.weights = c(10, 1, 10))
get.t.par(q = q, fit.weights = c(1, 100, 1))
get.t.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qt(p = c(0.025, 0.5, 0.975), df = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.t.par(q = q, scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.5, 0.5))
graphics::par(old.par)

q <- stats::qt(p = c(0.025, 0.5, 0.975), df = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.t.par(q = q, scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.5, 0.5))
get.t.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.5, 0.5))
graphics::par(old.par)

## example with only one quantile
q <- stats::qt(p = c(0.025), df = 3)
old.par <- graphics::par(mfrow = c(1, 3))
get.t.par(p = c(0.025), q = q)
get.t.par(p = c(0.025), q = q, fit.weights = 10)
get.t.par(p = c(0.025), q = q, fit.weights = 100)
graphics::par(old.par)




