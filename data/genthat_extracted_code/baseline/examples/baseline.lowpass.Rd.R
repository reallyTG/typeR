library(baseline)


### Name: baseline.lowpass
### Title: Low-pass FFT filter
### Aliases: baseline.lowpass
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.lowpass <- baseline(milk$spectra[1,, drop=FALSE], method='lowpass')
## Not run: 
##D 	plot(bc.lowpass)
## End(Not run)



