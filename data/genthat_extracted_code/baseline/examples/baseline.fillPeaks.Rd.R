library(baseline)


### Name: baseline.fillPeaks
### Title: Fill peaks
### Aliases: baseline.fillPeaks
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.fillPeaks <- baseline(milk$spectra[1,, drop=FALSE], lambda=6,
	hwi=50, it=10, int=2000, method='fillPeaks')
## Not run: 
##D 	plot(bc.fillPeaks)
## End(Not run)



