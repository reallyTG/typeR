library(refund)


### Name: fosr.perm
### Title: Permutation testing for function-on-scalar regression
### Aliases: fosr.perm fosr.perm.fit fosr.perm.test plot.fosr.perm
###   fosr.perm.fit fosr.perm.test plot.fosr.perm

### ** Examples


## Not run: 
##D # Test effect of region on mean temperature in the Canadian weather data
##D # The next two lines are taken from the fRegress.CV help file (package fda)
##D smallbasis  <- create.fourier.basis(c(0, 365), 25)
##D tempfd <- smooth.basis(day.5,
##D           CanadianWeather$dailyAv[,,"Temperature.C"], smallbasis)$fd
##D 
##D Xreg = cbind(1, model.matrix(~factor(CanadianWeather$region)-1))
##D conreg = matrix(c(0,1,1,1,1), 1)   # constrain region effects to sum to 0
##D 
##D # This is for illustration only; for a real test, must increase nperm
##D # (and probably prelim as well)
##D regionperm = fosr.perm(fdobj=tempfd, X=Xreg, con=conreg, method="OLS", nperm=10, prelim=3)
##D 
##D # Redo the plot, using axisIntervals() from the fda package
##D plot(regionperm, axes=FALSE, xlab="")
##D box()
##D axis(2)
##D axisIntervals(1)
## End(Not run)




