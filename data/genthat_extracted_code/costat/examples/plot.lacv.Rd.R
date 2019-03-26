library(costat)


### Name: plot.lacv
### Title: Plot localized autocovariance (lacv) object.
### Aliases: plot.lacv
### Keywords: ts

### ** Examples

#
# Make some dummy data, e.g. white noise
#
v <- rnorm(256)
#
# Compute the localized autocovariance (ok, the input is stationary
# but this is just an example. More interesting things could be achieved
# by putting the results of simulating from a LSW process, or piecewise
# stationary by concatenating different stationary realizations, etc.
#
vlacv <- lacv(v, lag.max=30)
#
# Now let's do some plotting of the localized autocovariance
#
## Not run: plot(vlacv, lags=0:6)
#
# Should get a plot where lag 0 is all up at value 1, and all other
# autocorrelations are near zero (since its white noise).
#
#
# How about just looking at lags 0, 2 and 4, and some different colours.
#
## Not run: plot(vlacv, lags=c(0,2,4), lcol=c(1,2,3))
#
# O.k. Let's concentrate on time t=200, let's look at a standard acf
# plot near there.
#
## Not run: plot(vlacv, type="acf", the.time=200)
#
# Now plot the autocovariance, rather than the autocorrelation.
#
## Not run: plot(vlacv, type="acf", the.time=200, plotcor=FALSE)
#
# Actually, the plot doesn't look a lot different as the series is white
# noise, but it is different if you look closely.



