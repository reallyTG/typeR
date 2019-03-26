library(psd)


### Name: psd-normalization
### Title: Normalization of power spectral density estimates.
### Aliases: normalization normalize normalize.amt normalize.list
###   normalize.spec psd-normalization

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Normalization
##D ##
##D 
##D # timeseries with sampling frequency **not** equal to 1:
##D set.seed(1234)
##D X <- ts(rnorm(1e3), frequency=20)
##D 
##D # spec.pgram: double sided
##D pgram <- spectrum(X)
##D 
##D # psdcore: single sided
##D PSD <- psdcore(X)
##D 
##D # note the normalization differences:
##D plot(pgram, log="dB", ylim=c(-40,10))
##D plot(PSD, add=TRUE, col="red", log="dB")
##D 
##D # A crude representation of integrated spectrum: 
##D #   should equal variance of white noise series (~= 1)
##D mean(pgram[['spec']]) * max(pgram[['freq']])
##D mean(PSD[['spec']]) * max(PSD[['freq']])
##D 
##D # normalize 
##D pgram <- normalize(pgram, src="spectrum")
##D PSD <- normalize(pgram, src="psd")
##D # replot them
##D plot(pgram, log="dB", ylim=c(-40,10))
##D plot(PSD, add=TRUE, col="red", log="dB")
##D 
##D # Again, integrated spectrum should be ~= 1:
##D mean(pgram[['spec']]) * max(pgram[['freq']])
##D mean(PSD[['spec']]) * max(PSD[['freq']])
##D 
##D 
## End(Not run)#REX



