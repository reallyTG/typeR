library(rriskDistributions)


### Name: get.gompertz.par
### Title: Fitting parameters of a Gompertz distribution from two or more
###   quantiles
### Aliases: get.gompertz.par
### Keywords: fitpercentiles

### ** Examples

q <- eha::qgompertz(p = c(0.025, 0.5, 0.975), shape = 2, scale = 5)
old.par <- graphics::par(mfrow = c(2, 3))
get.gompertz.par(q = q)
get.gompertz.par(q = q, fit.weights = c(100, 1, 100))
get.gompertz.par(q = q, fit.weights = c(10, 1, 10))
get.gompertz.par(q = q, fit.weights = c(1, 100, 1))
get.gompertz.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- eha::qgompertz(p = c(0.025, 0.5, 0.975), shape = 0.2, scale = 0.5)
old.par <- graphics::par(mfrow = c(2, 3))
get.gompertz.par(q = q)
get.gompertz.par(q = q, fit.weights = c(100, 1, 100))
get.gompertz.par(q = q, fit.weights = c(10, 1, 10))
get.gompertz.par(q = q, fit.weights = c(1, 100, 1))
get.gompertz.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- eha::qgompertz(p = c(0.025, 0.5, 0.975), shape = 1, scale = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.gompertz.par(q = q)
get.gompertz.par(q = q, fit.weights = c(100, 1, 100))
get.gompertz.par(q = q, fit.weights = c(10, 1, 10))
get.gompertz.par(q = q, fit.weights = c(1, 100, 1))
get.gompertz.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantiles
q <- eha::qgompertz(p = c(0.025, 0.975), shape = 2, scale = 5)
old.par <- graphics::par(mfrow = c(2, 3))
get.gompertz.par(p = c(0.025, 0.975), q = q)
get.gompertz.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1), scaleX = c(0.0001, 0.9999))
get.gompertz.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100))
get.gompertz.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.gompertz.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
graphics::par(old.par)




