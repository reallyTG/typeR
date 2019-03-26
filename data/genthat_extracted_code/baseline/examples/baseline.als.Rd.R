library(baseline)


### Name: baseline.als
### Title: Asymmetric Least Squares
### Aliases: baseline.als
### Keywords: baseline spectra

### ** Examples

data(milk)
bc.als <- baseline(milk$spectra[1,, drop=FALSE], lambda=10, method='als')
## Not run: 
##D plot(bc.als)
## End(Not run)



