library(rriskDistributions)


### Name: get.lnorm.par
### Title: Fitting parameters of a lognormal distribution from two or more
###   quantiles
### Aliases: get.lnorm.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qlnorm(p = c(0.025, 0.5, 0.975), meanlog = 4, sdlog = 0.8)
old.par <- graphics::par(mfrow = c(2, 3))
get.lnorm.par(q = q)
get.lnorm.par(q = q, fit.weights = c(100, 1, 100))
get.lnorm.par(q = q, fit.weights = c(10, 1, 10))
get.lnorm.par(q = q, fit.weights = c(1, 100, 1))
get.lnorm.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qlnorm(p = c(0.025, 0.5, 0.975), meanlog=-4, sdlog = 0.8)
old.par <- graphics::par(mfrow = c(2, 3))
get.lnorm.par(q = q)
get.lnorm.par(q = q, fit.weights = c(100, 1, 100))
get.lnorm.par(q = q, fit.weights = c(10, 1, 10))
get.lnorm.par(q = q, fit.weights = c(1, 100, 1))
get.lnorm.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qlnorm(p = c(0.025, 0.5, 0.975), meanlog = 1, sdlog = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.lnorm.par(q = q)
get.lnorm.par(q = q, fit.weights = c(100, 1, 100))
get.lnorm.par(q = q, fit.weights = c(10, 1, 10))
get.lnorm.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.000001, 0.99999999))
get.lnorm.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qlnorm(p = c(0.025, 0.5, 0.975), meanlog = 0.1, sdlog = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.lnorm.par(q = q)
get.lnorm.par(q = q, fit.weights = c(100, 1, 100))
get.lnorm.par(q = q, fit.weights = c(10, 1, 10))
get.lnorm.par(q = q, fit.weights = c(1, 100, 1))
get.lnorm.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qlnorm(p = c(0.025, 0.975), meanlog = 4, sdlog = 0.8)
old.par <- graphics::par(mfrow = c(2, 3))
get.lnorm.par(p = c(0.025, 0.975), q = q)
get.lnorm.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1), scaleX = c(0.1, 0.001))
get.lnorm.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100), scaleX = c(0.1, 0.001))
get.lnorm.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.lnorm.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
graphics::par(old.par)




