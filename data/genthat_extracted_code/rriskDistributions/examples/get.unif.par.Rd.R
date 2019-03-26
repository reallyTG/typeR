library(rriskDistributions)


### Name: get.unif.par
### Title: Fitting parameters of a uniform distribution from two or more
###   quantiles
### Aliases: get.unif.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qunif(p = c(0.025, 0.975), min = 0, max = 5)
get.unif.par(q = q)
get.unif.par(q = q, scaleX = c(0.001, 0.999))

q <- stats::qunif(p = c(0.025, 0.975), min=-6, max = 5)
get.unif.par(q = q)




