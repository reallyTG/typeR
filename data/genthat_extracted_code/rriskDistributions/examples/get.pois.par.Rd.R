library(rriskDistributions)


### Name: get.pois.par
### Title: Fitting parameter of Poisson distribution from one or more
###   quantiles
### Aliases: get.pois.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qpois(p = c(0.025, 0.5, 0.975), lambda = 3)
old.par <- graphics::par(mfrow = c(2, 3))
get.pois.par(q = q)
get.pois.par(q = q, fit.weights = c(100, 1, 100))
get.pois.par(q = q, fit.weights = c(10, 1, 10))
get.pois.par(q = q, fit.weights = c(1, 100, 1))
get.pois.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qpois(p = c(0.025, 0.5, 0.975), lambda = 4)
old.par <- graphics::par(mfrow = c(2, 3))
get.pois.par(q = q)
get.pois.par(q = q, fit.weights = c(100, 1, 100))
get.pois.par(q = q, fit.weights = c(10, 1, 10))
get.pois.par(q = q, fit.weights = c(1, 100, 1))
get.pois.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qpois(p = c(0.025, 0.5, 0.975), lambda = 0.5)
old.par <- graphics::par(mfrow = c(2, 3))
get.pois.par(q = q, tol = 1)
get.pois.par(q = q, fit.weights = c(100, 1, 100), tol = 1)
get.pois.par(q = q, fit.weights = c(10, 1, 10), tol = 1)
get.pois.par(q = q, fit.weights = c(1, 100, 1))
get.pois.par(q = q, fit.weights = c(1, 10, 1), tol = 0.01)
graphics::par(old.par)

q <- stats::qpois(p = c(0.025, 0.5, 0.975), lambda = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.pois.par(q = q, tol = 0.01)
get.pois.par(q = q, fit.weights = c(100, 1, 100), tol = 0.01)
get.pois.par(q = q, fit.weights = c(10, 1, 10), tol = 0.01)
get.pois.par(q = q, fit.weights = c(1, 100, 1))
get.pois.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)




