library(GLDEX)


### Name: fun.plot.fit
### Title: Plotting the univariate generalised lambda distribution fits on
###   the data set.
### Aliases: fun.plot.fit
### Keywords: hplot

### ** Examples

## Generate Normally distribute random numbers as dataset
# junk<-rnorm(1000,3,2)

## Fit the data set using fun.data.fit.ml. 
## Also, fun.data.fit.hs or fun.data.fit.hs.nw can be used.
# obj.fit<-fun.data.fit.ml(junk)

## Plot the resulting fits
# fun.plot.fit(obj.fit,junk,xlab="x",name=".ML",param.vec=c("rs","fmkl","fmkl"))

## This function also works for singular fits such as those by fun.RPRS.ml,
## fun.RMFMKL.ml, fun.RPRS.hs, fun.RMFMKL.hs, fun.RPRS.hs.nw, fun.RMFMKL.hs.nw
# junk<-rnorm(1000,3,2)
# obj.fit<-fun.RPRS.ml(junk)
# fun.plot.fit(obj.fit,junk,xlab="x",name="RPRS.ML",param.vec=c("rs"))



