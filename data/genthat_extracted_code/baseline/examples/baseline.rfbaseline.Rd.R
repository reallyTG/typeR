library(baseline)


### Name: baseline.rfbaseline
### Title: Robust Baseline Estimation
### Aliases: baseline.rfbaseline
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.rbe <- baseline(milk$spectra[1,, drop=FALSE], method='rfbaseline',
  span=NULL, NoXP=1000)
## Not run: 
##D 	plot(bc.rbe)
## End(Not run)



