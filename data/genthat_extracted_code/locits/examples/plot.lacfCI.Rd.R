library(locits)


### Name: plot.lacfCI
### Title: Plot confidence intervals for localized autocovariance for
###   locally stationary time series.
### Aliases: plot.lacfCI
### Keywords: ts

### ** Examples

#
# Simulate a TVAR(1) process
#
x <- tvar1sim()
#
# Computes its time-localized autocovariance and confidence intervals
# Note: smoothing is done automatically!
#
x.lacf <- Rvarlacf(x=x, nz=50, var.lag.max=20)
#
# Now plot this, plot covariances as an acf plot, with the CIs
#
## Not run: plot(x.lacf, type="acf", plotcor=FALSE)
#
# Now plot it as a line plot, as correlations and can't do CIs
#
## Not run: plot(x.lacf)



