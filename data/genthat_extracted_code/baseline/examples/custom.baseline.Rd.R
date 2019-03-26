library(baseline)


### Name: custom.baseline
### Title: Customized baseline correction
### Aliases: custom.baseline
### Keywords: baseline spectra

### ** Examples

data(milk)
spectrum1  <- milk$spectra[1,1:10000,drop=FALSE]
ordinary   <- baseline(spectrum1, method="als", lambda=6, p=0.01)
customized <- custom.baseline(spectrum1, 2900, c(1,20), trans.win=100, 
	just.plot=FALSE, method="als", lambda=6, p=0.01)
## Not run: 
##D plot(1:10000,spectrum1, type='l')
##D lines(1:10000,getBaseline(ordinary), lty=2, col=2, lwd=2)
##D lines(1:10000,customized$baseline, lty=3, col=3, lwd=2)
## End(Not run)



