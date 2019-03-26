library(deseasonalize)


### Name: ds
### Title: deseasonalize a time series
### Aliases: ds
### Keywords: ts

### ** Examples

#Example 1. Simple example.
out <- ds(nottem, Fm=2, Fs=2, type="monthly")
summary(out)
#
#Example 2. longer example
## Not run: 
##D out <- ds(nottem, type="monthly")
##D #from the table below we see that 2 Fourier components are used for the seasonal means
##D # and 0 components for the seasonal standard deviations.
##D out$dispar
##D #check that the series is deasonalized using the cumulative periodogram test
##D cpgram(out$z)
## End(Not run)
#
#Example 3
#As a check, compute deaseasonalized time series using full transformation.
#Then monthly means should be close to 0 and monthly sd close to 1.0.
#But not exact due to harmonic regression errors.
z <- ds(nottem, Fm=6, Fs=6, type="monthly", searchQ=FALSE)$z
apply(matrix(z, ncol=12, byrow=TRUE), MARGIN=2, mean )
apply(matrix(z, ncol=12, byrow=TRUE), MARGIN=2, sd )



