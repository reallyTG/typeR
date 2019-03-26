library(refund)


### Name: fosr
### Title: Function-on-scalar regression
### Aliases: fosr

### ** Examples

## Not run: 
##D require(fda)
##D # The first two lines, adapted from help(fRegress) in package fda,
##D # set up a functional data object representing daily average
##D # temperatures at 35 sites in Canada
##D daybasis25 <- create.fourier.basis(rangeval=c(0, 365), nbasis=25,
##D                   axes=list('axesIntervals'))
##D Temp.fd <- with(CanadianWeather, smooth.basisPar(day.5,
##D                 dailyAv[,,'Temperature.C'], daybasis25)$fd)
##D 
##D modmat = cbind(1, model.matrix(~ factor(CanadianWeather$region) - 1))
##D constraints = matrix(c(0,1,1,1,1), 1)
##D 
##D # Penalized OLS with smoothing parameter chosen by grid search
##D olsmod = fosr(fdobj = Temp.fd, X = modmat, con = constraints, method="OLS", lambda=100*10:30)
##D plot(olsmod, 1)
##D 
##D # Test use formula to fit fosr
##D set.seed(2121)
##D data1 <- pffrSim(scenario="ff", n=40)
##D formod = fosr(Y~xlin+xsmoo, data=data1)
##D plot(formod, 1)
##D 
##D # Penalized GLS
##D glsmod = fosr(fdobj = Temp.fd, X = modmat, con = constraints, method="GLS")
##D plot(glsmod, 1)
## End(Not run)



