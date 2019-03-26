library(locits)


### Name: ewspec3
### Title: Compute evolutionary wavelet spectrum of a time series.
### Aliases: ewspec3
### Keywords: ts

### ** Examples

#
# Generate time series
#
x <- tvar1sim()
#
# Compute its evolutionary wavelet spectrum, with linear running mean smooth
#
x.ewspec3 <- ewspec3(x)
#
# Plot the answer, probably its a bit variable, because the default bandwidth
# is 5, which is probably inappropriate for many series
#
## Not run: plot(x.ewspec3$S)
#
# Try a larger bandwidth
#
x.ewspec3 <- ewspec3(x, binwidth=100)
#
# Plot the answer, should look a lot smoother
#
# Note, a lot of high frequency power on the right hand side of the plot,
# which is expected as process looks like AR(1) with param of -0.9
#
## Not run: plot(x.ewspec3$S)
#
# Do smoothing like ewspec (but additionally AutoReflect)
#
x.ewspec3 <- ewspec3(x, WPsmooth.type="wavelet")
#
# Plot the results
#
## Not run: plot(x.ewspec3$S)
#
# Another possibility is to use AutoBestBW which tries to find the best
# linear smooth closest to a wavelet smooth. This makes use of ewspec3
#



