library(rriskDistributions)


### Name: get.norm.par
### Title: Fitting parameters of normal distribution from two or more
###   quantiles
### Aliases: get.norm.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 12, sd = 34)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.par(q = q)
get.norm.par(q = q, scaleX = c(0.00001, 0.99999))
get.norm.par(q = q, fit.weights = c(10, 1, 10))
get.norm.par(q = q, fit.weights = c(1, 10, 1))
get.norm.par(q = q, fit.weights = c(100, 1, 100))
get.norm.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 0, sd = 1)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.par(q = q)
get.norm.par(q = q, fit.weights = c(10, 1, 10))
get.norm.par(q = q, fit.weights = c(1, 10, 1))
get.norm.par(q = q, fit.weights = c(100, 1, 100))
get.norm.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 0.1, sd = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.par(q = q)
get.norm.par(q = q, fit.weights = c(10, 1, 10))
get.norm.par(q = q, fit.weights = c(1, 10, 1))
get.norm.par(q = q, fit.weights = c(100, 1, 100))
get.norm.par(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qnorm(p = c(0.025, 0.975), mean = 12, sd = 34)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.par(p = c(0.025, 0.975), q = q)
get.norm.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.norm.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.norm.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
get.norm.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100))
graphics::par(old.par)




