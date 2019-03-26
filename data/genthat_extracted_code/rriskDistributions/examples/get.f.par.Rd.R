library(rriskDistributions)


### Name: get.f.par
### Title: Fitting parameters of a F distribution from two or more
###   quantiles
### Aliases: get.f.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qf(p = c(0.025, 0.5, 0.975), df1 = 2, df2 = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.f.par(q = q, scaleX = c(0.1, 0.5))
get.f.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.1, 0.5))
get.f.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.1, 0.5))
get.f.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.1, 0.5))
get.f.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.1, 0.5))
graphics::par(old.par)

q <- stats::qf(p = c(0.025, 0.5, 0.975), df1 = 0.2, df2 = 0.3)
old.par <- graphics::par(mfrow = c(2, 3))
get.f.par(q = q, scaleX = c(0.1, 0.2))
get.f.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.1, 0.999))
get.f.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.1, 0.2))
get.f.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.1, 0.9999))
get.f.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.1, 0.9999))
graphics::par(old.par)

q <- stats::qf(p = c(0.025, 0.5, 0.975), df1 = 1, df2 = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.f.par(q = q, scaleX = c(0.1, 0.2))
get.f.par(q = q, fit.weights = c(100, 1, 100), scaleX = c(0.1, 0.2))
get.f.par(q = q, fit.weights = c(10, 1, 10), scaleX = c(0.1, 0.2))
get.f.par(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.1, 0.2))
get.f.par(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.1, 0.2))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qf(p = c(0.025, 0.975), df1 = 2, df2 = 3)
old.par <- graphics::par(mfrow = c(1, 3))
get.f.par(p = c(0.025, 0.975), q = q)
get.f.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.f.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
graphics::par(old.par)




