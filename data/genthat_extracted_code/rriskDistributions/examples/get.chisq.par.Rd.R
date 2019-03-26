library(rriskDistributions)


### Name: get.chisq.par
### Title: Fitting parameter of a chi-square distribution from one or more
###   quantiles
### Aliases: get.chisq.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qchisq(p = c(0.025, 0.5, 0.975), df = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisq.par(q = q)
get.chisq.par(q = q, fit.weights = c(10, 1, 10))
get.chisq.par(q = q, fit.weights = c(100, 1, 100))
get.chisq.par(q = q, fit.weights = c(1, 10, 1))
get.chisq.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qchisq(p = c(0.025, 0.5, 0.975), df = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisq.par(q = q, scaleX = c(0.1, 0.1))
get.chisq.par(q = q, fit.weights = c(10, 1, 10))
get.chisq.par(q = q, fit.weights = c(100, 1, 100))
get.chisq.par(q = q, fit.weights = c(1, 10, 1))
get.chisq.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qchisq(p = c(0.025, 0.5, 0.975), df = 20)
old.par <- graphics::par(mfrow = c(2, 3))
get.chisq.par(q = q)
get.chisq.par(q = q, fit.weights = c(10, 1, 10))
get.chisq.par(q = q, fit.weights = c(100, 1, 100))
get.chisq.par(q = q, fit.weights =c(1, 10, 1))
get.chisq.par(q = q, fit.weights =c(1, 100, 1))
graphics::par(old.par)

## example with only one quantile
q <- stats::qchisq(p = c(0.025), df = 20)
old.par <- graphics::par(mfrow = c(1, 3))
get.chisq.par(p = c(0.025), q = q)
get.chisq.par(p = c(0.025), q = q, fit.weights = 10)
get.chisq.par(p = c(0.025), q = q, fit.weights = 100)
graphics::par(old.par)




