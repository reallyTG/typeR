library(rriskDistributions)


### Name: get.tnorm.par
### Title: Fitting parameters of truncated normal distribution from four or
###   more quantiles
### Aliases: get.tnorm.par
### Keywords: fitpercentiles

### ** Examples

q <- msm::qtnorm(p = c(0.025, 0.5, 0.75, 0.975), mean = 3, sd = 3, lower = 0, upper = 10)
old.par <- graphics::par(mfrow = c(2, 3))
get.tnorm.par(q = q)
get.tnorm.par(q = q, scaleX = c(0.1, 0.999999))
get.tnorm.par(q = q, fit.weights = c(100, 1, 1, 100))
get.tnorm.par(q = q, fit.weights = c(10, 1, 1, 10))
get.tnorm.par(q = q, fit.weights = c(1, 100, 1, 1))
get.tnorm.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)

q <- msm::qtnorm(p = c(0.025, 0.5, 0.75, 0.975), mean = 3, sd = 0.1, lower=-1, upper = 4)
old.par <- graphics::par(mfrow = c(2, 3))
get.tnorm.par(q = q)
get.tnorm.par(q = q, fit.weights = c(100, 1, 1, 100))
get.tnorm.par(q = q, fit.weights = c(10, 1, 1, 10))
get.tnorm.par(q = q, fit.weights = c(1, 100, 1, 1))
get.tnorm.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)

q <- msm::qtnorm(p = c(0.025, 0.5, 0.75, 0.975), mean = 0, sd = 1, lower=-2, upper = 2)
old.par <- graphics::par(mfrow = c(2, 3))
get.tnorm.par(q = q)
get.tnorm.par(q = q, fit.weights = c(100, 1, 1, 100))
get.tnorm.par(q = q, fit.weights = c(10, 1, 1, 10))
get.tnorm.par(q = q, fit.weights = c(1, 100, 1, 1))
get.tnorm.par(q = q, fit.weights = c(1, 10, 1, 1))
graphics::par(old.par)




