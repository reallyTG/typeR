library(lmom)


### Name: cdfwei
### Title: Weibull distribution
### Aliases: cdfwei quawei
### Keywords: distribution

### ** Examples

# Random sample from a 2-parameter Weibull distribution
# with scale parameter 2 and shape parameter 1.5.
quawei(runif(100), c(0,2,1.5))

# Illustrate the relation between Weibull and GEV distributions.
# weifit() fits a Weibull distribution to data and returns
#   quantiles of the fitted distribution
# gevfit() fits a Weibull distribution as a "reverse GEV",
#   i.e. fits a GEV distribution to the negated data,
#   then computes negated quantiles
weifit <- function(qval, x) quawei(qval, pelwei(samlmu(x)))
gevfit <- function(qval, x) -quagev(1-qval, pelgev(samlmu(-x)))
# Compare on Ozone data
data(airquality)
weifit(c(0.2,0.5,0.8), airquality$Ozone)
gevfit(c(0.2,0.5,0.8), airquality$Ozone)



