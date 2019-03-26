library(costat)


### Name: lacv
### Title: Computes localized (wavelet) autocovariance function
### Aliases: lacv
### Keywords: ts

### ** Examples

#
# Generate an AR(1) time series
#
vsim <- arima.sim(model=list(ar=0.8), n=1024)
#
# Compute the ACF of this stationary series
#
vsim.acf <- acf(vsim, plot=FALSE)
#
# Compute the localized autocovariance. We'll use
# a reasonably smooth wavelet.
#
vsim.lacv <- lacv(vsim, filter.number=4, lag.max=30)
#
# Now plot the time-varying autocorrelations, only the first 5 lags
#
## Not run: plot(vsim.lacv, lags=0:5)
#
# Now plot the localized autocorrelation at time t=100, a plot similar
# to the usual R acf plot.
#
## Not run: plot(vsim.lacv, type="acf", the.time=100)



