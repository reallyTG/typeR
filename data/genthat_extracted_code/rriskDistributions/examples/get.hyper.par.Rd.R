library(rriskDistributions)


### Name: get.hyper.par
### Title: Fitting parameters of a hypergeometric distribution from three
###   or more quantiles
### Aliases: get.hyper.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qhyper(p = c(0.025, 0.5, 0.975), m = 5, n = 3, k = 3)
old.par <- graphics::par(mfrow = c(2, 3))
get.hyper.par(q = q)
get.hyper.par(q = q, tol = 1)
get.hyper.par(q = q, fit.weights = c(100, 1, 100))
get.hyper.par(q = q, fit.weights = c(10, 1, 10))
get.hyper.par(q = q, fit.weights = c(1, 100, 1))
get.hyper.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qhyper(p = c(0.025, 0.5, 0.975), m = 10, n = 5, k = 4)
old.par <- graphics::par(mfrow = c(2, 3))
get.hyper.par(q = q)
get.hyper.par(q = q, fit.weights = c(100, 1, 100))
get.hyper.par(q = q, fit.weights = c(10, 1, 10))
get.hyper.par(q = q, fit.weights = c(1, 100, 1))
get.hyper.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)




