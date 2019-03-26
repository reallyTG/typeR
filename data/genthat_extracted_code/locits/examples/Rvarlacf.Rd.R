library(locits)


### Name: Rvarlacf
### Title: Compute confidence intervals for localized autocovariance for
###   locally stationary time series.
### Aliases: Rvarlacf
### Keywords: ts

### ** Examples

#
# Do localized autocovariance on a iid Gaussian sequence
#
tmp <- Rvarlacf(rnorm(256), nz=125)
#
# Plot the localized autocovariances over time (default plot, doesn't
# produce CIs)
#
## Not run: plot(tmp)
#
# You should get a plot where the lag 0 acs are all near 1 and all the
# others are near zero, the acfs over time. 
#
## Not run: plot(tmp, plotcor=FALSE, type="acf")
#
# This plots the autocovariances (note: \code{plotcor=FALSE}) and the
# type of plot is \code{"acf"} which means like a regular ACF plot, except
# this is c(125, tau), ie the acf localized to time=125 The confidence
# intervals are also plotted. 
# The plot subtitle indicates that it is c(125, tau) that is being plotted
#



