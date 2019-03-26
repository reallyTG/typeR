library(baseline)


### Name: baseline.modpolyfit
### Title: Modified polynomial fitting
### Aliases: baseline.modpolyfit
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.modpolyfit <- baseline(milk$spectra[1,, drop=FALSE], method='modpolyfit', deg=6)
## Not run: 
##D 	plot(bc.modpolyfit)
## End(Not run)



