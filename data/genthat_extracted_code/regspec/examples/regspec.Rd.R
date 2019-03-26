library(regspec)


### Name: regspec
### Title: Non-parametric Multirate Spectral Density Estimation via Linear
###   Bayes.
### Aliases: regspec
### Keywords: ts smooth

### ** Examples

## The examples here use datasets Dfexample, Dpexample2, Dpexample3 and
## spec.true, which should be loaded automatically with the package.


# FIRST EXAMPLE
# Estimates a spectrum from a time series observed at integer time points.
#
# Plot a 'point' estimate and intervals around it.
# Also plot the true spectrum afterwards with a dashed line
#
adjustment <- regspec(D=Dfexample[1:24], deltat=1, smthpar=0.8,
		ylim=c(0,60), plot.pgram=TRUE)

lines(spec.true, col=1, lwd=3, lty=2)

#
#
# SECOND EXAMPLE
# Does he same except the observations are sampled at every two time units.
#
# Plot a 'point' estimate and intervals around it.

adjustment <- regspec(D=Dpexample2, deltat=2, smthpar=0.8, ylim=c(0,60))

lines(spec.true, col=1, lwd=3, lty=2)

#
# THIRD EXAMPLE
# Now estimate a spectrum from unit sampled data and put answer in the
# object called adjustment1. Then use the estimated quantities in this
# object (notably the ebeta and vbeta components) to update the spectral
# estimate by a second call to regspec using new, data sampled at even time
# points and put the result into the adjustment2 object
#

adjustment1 <- regspec(D=Dfexample[1:24], deltat=1, smthpar=0.8,
	ylim=c(0,60))

lines(spec.true, col=1, lwd=3, lty=2)

adjustment2 <- regspec(D=Dpexample2, deltat=2, ebeta=adjustment1$ebeta,
	vbeta=adjustment1$vbeta, ylim=c(0,60))

lines(spec.true, col=1, lwd=3, lty=2)


# FOURTH EXAMPLE
# Estimate spectrum from series observed at each third integer.
# Plot a 'point' estimate and intervals around it.

adjustment <- regspec(D=Dpexample3, deltat=3, smthpar=0.8, ylim=c(0,60))

lines(spec.true, col=1, lwd=3, lty=2)

# FIFTH EXAMPLE
# Estimate a spectrum from one time series of observations at every
# time point and then update with another at every third time point.
#
# Note how information from the first spectral estimate gets passed to
# the second call of regspec via the ebeta and vbeta components/arguments.
#

adjustment1 <- regspec(D=Dfexample[1:24], deltat=1, smthpar=0.8, ylim=c(0,60))

lines(spec.true, col=1, lwd=3, lty=2)

adjustment2 <- regspec(D=Dpexample3, deltat=3, ebeta=adjustment1$ebeta,
	vbeta=adjustment1$vbeta, ylim=c(0,60))

lines(spec.true, col=1, lwd=3, lty=2)

# SIXTH EXAMPLE
#
# Estimating a spectrum from a time series of filtered observations.

# Filter the example data.

# Create empty vector
Dfexample.filtered <- c()

# Create filter
filter.vect <- 4*runif(5)

# Now produce filtered data
m <- length(filter.vect)-1

for(i in 1:(length(Dfexample)-m)){
	Dfexample.filtered[i] <- crossprod(Dfexample[i+m-0:m],filter.vect)
	}

# Now use filterered data to try and estimate spectrum of original data

adjustment1 <- regspec(D=Dfexample.filtered, smthpar=0.8, filter=filter.vect,
	ylim=c(0,80), plot.pgram=TRUE)

lines(spec.true, col=1, lwd=3, lty=2)

# Note here how the periodogram values do not correspond to the estimated
# spectrum because the periodogram of the  filtered data is computed and
# plotted, but then is used to estimate the spectrum of the un-filtered
# process.


# SEVENTH EXAMPLE
# Estimate spectrum according to its deviation from a known SARIMA model.

# Define a SARIMA model like this one

SARIMA0 <- list(ar=0.3,sigma2=1,seasonal=list(sar=0.5,sma=0,period=12))

# or like this one

SARIMA0 <- list(ar=c(-0.5, 0.4, 0.8), ma=0.2, sigma2=1)

# Then perform adjustments as before

adjustment <- regspec(D=Dfexample[1:16], deltat=1, smthpar=0.8, ylim=c(0,60),
	SARIMA=SARIMA0, plot.pgram=TRUE)

adjustment <- regspec(D=Dpexample2, deltat=2, smthpar=0.8, ylim=c(0,60),
	SARIMA=SARIMA0, plot.pgram=TRUE)

lines(spec.true, col=1, lwd=3, lty=2)

# This is useful for introducing prior beliefs for the structural form of the
# spectrum. Specifically, it is useful for specifying a prior belief in
# seasonality.



