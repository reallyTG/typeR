library(costat)


### Name: TOSts
### Title: A test statistic for stationarity
### Aliases: TOSts
### Keywords: ts

### ** Examples

#
# Compute a spectral estimate on an sample time series (just use iid data)
#
xsim <- rnorm(128)
xews <- ewspec(xsim, smooth.dev=var)$S
#
# You could plot this spectral estimate if you liked
#
## Not run: plot(xews)
#
# Compute test statistic
#
TOSts(xews)
#[1] 0.1199351
#
# Although the time series x here is a realization from a stationary process
# the test statistic is not zero (this is because of the estimation error
# inherent in this small sample). 
#
# This is why the bootstrap test, \code{BootTOS} is required to
# assess the significance of the test statistic value.



