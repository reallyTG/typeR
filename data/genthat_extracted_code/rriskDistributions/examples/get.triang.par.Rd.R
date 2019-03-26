library(rriskDistributions)


### Name: get.triang.par
### Title: Fitting parameters of a triangular distribution from three or
###   more quantiles
### Aliases: get.triang.par
### Keywords: fitpercentiles

### ** Examples

q <- mc2d::qtriang(p = c(0.025, 0.5, 0.975), min = 0, mode = 3, max = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.triang.par(q = q)
get.triang.par(q = q, fit.weights = c(100, 1, 100))
get.triang.par(q = q, fit.weights = c(10, 1, 10))
get.triang.par(q = q, fit.weights = c(1, 100, 1))
get.triang.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- mc2d::qtriang(p = c(0.025, 0.5, 0.975), min = 1, mode = 5, max = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.triang.par(q = q)
get.triang.par(q = q, scaleX = c(0.00001, 0.99999))
get.triang.par(q = q, fit.weights = c(100, 1, 100))
get.triang.par(q = q, fit.weights = c(10, 1, 10))
get.triang.par(q = q, fit.weights = c(1, 100, 1))
get.triang.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## bad fit for negative values
q <- mc2d::qtriang(p = c(0.025, 0.5, 0.975), min=-20, mode = 5, max = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.triang.par(q = q, tol = 0.1)
get.triang.par(q = q)
get.triang.par(q = q, fit.weights = c(100, 1, 100))
get.triang.par(q = q, fit.weights = c(10, 1, 10))
get.triang.par(q = q, fit.weights = c(1, 100, 1), tol = 1)
get.triang.par(q = q, fit.weights = c(1, 10, 1), tol = 1)
graphics::par(old.par)

## other examples
q <- mc2d::qtriang(p = c(0.025, 0.5, 0.975), min=-20, mode = 5, max = 10)
get.triang.par(q = q, tol = 0.3)




