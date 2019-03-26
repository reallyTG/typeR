library(rriskDistributions)


### Name: get.chisqnc.par
### Title: Fitting parameters of a non-central chi-square distribution from
###   one or more quantiles
### Aliases: get.chisqnc.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qchisq(p = c(0.025, 0.5, 0.975), df = 2, ncp = 4)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisqnc.par(q = q)
get.chisqnc.par(q = q, scaleX = c(0.1, 0.9999999))
get.chisqnc.par(q = q, fit.weights = c(100, 1, 100))
get.chisqnc.par(q = q, fit.weights = c(10, 1, 10))
get.chisqnc.par(q = q, fit.weights = c(1, 100, 1))
get.chisqnc.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qchisq(p = c(0.025, 0.5, 0.975), df = 0.1, ncp = 0.4)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisqnc.par(q = q)
get.chisqnc.par(q = q, fit.weights = c(100, 1, 100))
get.chisqnc.par(q = q, fit.weights = c(10, 1, 10))
get.chisqnc.par(q = q, fit.weights = c(1, 100, 1))
get.chisqnc.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qchisq(p = c(0.025, 0.5, 0.975), df = 1, ncp = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisqnc.par(q = q)
get.chisqnc.par(q = q, fit.weights = c(100, 1, 100))
get.chisqnc.par(q = q, fit.weights = c(10, 1, 10))
get.chisqnc.par(q = q, fit.weights = c(1, 100, 1))
get.chisqnc.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantile
q <- stats::qchisq(p = c(0.025, 0.95), df = 20, ncp = 20)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisqnc.par(p = c(0.025, 0.975), q = q)
get.chisqnc.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.chisqnc.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100))
get.chisqnc.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.chisqnc.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
graphics::par(old.par)




