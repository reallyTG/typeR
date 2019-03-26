library(costat)


### Name: costat-package
### Title: Computes localized autocovariance and searches for costationary
###   solutions to bivariate time series.
### Aliases: costat-package costat
### Keywords: ts

### ** Examples

#
# Compute localized acv
#
x <- c(rnorm(128, sd=1), rnorm(128, sd=3))
xlacv <- lacv(x, lag.max=30)
#
# Plot the time-varying autocovariance at time t=100
#
## Not run: plot(xlacv, type="acf", the.time=100, plotcor=FALSE)
#
# Plot the time-varying autocovariance at time t=400
#
## Not run: plot(xlacv, type="acf", the.time=400, plotcor=FALSE)
#
# See examples for findstysols for other examples
#



