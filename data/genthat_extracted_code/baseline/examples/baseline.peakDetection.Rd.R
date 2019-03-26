library(baseline)


### Name: baseline.peakDetection
### Title: Simultaneous Peak Detection and Baseline Correction
### Aliases: baseline.peakDetection
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.peakDetection <- baseline(milk$spectra[1,, drop=FALSE], method='peakDetection',
	left=300, right=300, lwin=50, rwin=50)
## Not run: 
##D 	plot(bc.peakDetection)
## End(Not run)



