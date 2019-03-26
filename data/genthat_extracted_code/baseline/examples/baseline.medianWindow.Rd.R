library(baseline)


### Name: baseline.medianWindow
### Title: Median window
### Aliases: baseline.medianWindow
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.medianWindow <- baseline(milk$spectra[1,, drop=FALSE], hwm=300,
	method='medianWindow')
## Not run: 
##D 	plot(bc.medianWindow)
## End(Not run)



