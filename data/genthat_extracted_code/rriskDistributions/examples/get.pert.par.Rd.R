library(rriskDistributions)


### Name: get.pert.par
### Title: Fitting parameters of a pert distribution from four or more
###   quantiles
### Aliases: get.pert.par
### Keywords: fitpercentiles

### ** Examples

q <- mc2d::qpert(p = c(0.025, 0.5, 0.6, 0.975), min = 0, mode = 3, max = 10, shape = 5)
old.par <- graphics::par(mfrow = c(2, 3))
get.pert.par(q = q)
get.pert.par(q = q, fit.weights = c(100, 1, 1, 100))
get.pert.par(q = q, fit.weights = c(10, 1, 1, 10))
get.pert.par(q = q, fit.weights = c(1, 100, 1, 1))
get.pert.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)

q <- mc2d::qpert(p = c(0.025, 0.5, 0.6, 0.975), min = 1, mode = 5, max = 10, shape = 4)
old.par <- graphics::par(mfrow = c(2, 3))
get.pert.par(q = q)
get.pert.par(q = q, scaleX = c(0.0001, 0.999999))
get.pert.par(q = q, fit.weights = c(100, 1, 1, 100))
get.pert.par(q = q, fit.weights = c(10, 1, 1, 10))
get.pert.par(q = q, fit.weights = c(1, 100, 1, 1))
get.pert.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)

q <- mc2d::qpert(p = c(0.025, 0.5, 0.6, 0.975), min=-10, mode = 5, max = 10, shape = 4)
old.par <- graphics::par(mfrow = c(2, 3))
get.pert.par(q = q)
get.pert.par(q = q, fit.weights = c(100, 1, 1, 100))
get.pert.par(q = q, fit.weights = c(10, 1, 1, 10))
get.pert.par(q = q, fit.weights = c(1, 100, 1, 1))
get.pert.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)

q <- mc2d::qpert(p = c(0.025, 0.5, 0.6, 0.975), min=-10, mode = 5, max = 10, shape = 0.4)
old.par <- graphics::par(mfrow = c(2, 3))
get.pert.par(q = q)
get.pert.par(q = q, fit.weights = c(100, 1, 1, 100))
get.pert.par(q = q, fit.weights = c(10, 1, 1, 10))
get.pert.par(q = q, fit.weights = c(1, 100, 1, 1))
get.pert.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)




