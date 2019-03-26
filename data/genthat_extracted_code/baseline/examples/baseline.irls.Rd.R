library(baseline)


### Name: baseline.irls
### Title: Iterative Restricted Least Squares
### Aliases: baseline.irls
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.irls <- baseline(milk$spectra[1,, drop=FALSE], method='irls')
## Not run: 
##D 	plot(bc.irls)
## End(Not run)



