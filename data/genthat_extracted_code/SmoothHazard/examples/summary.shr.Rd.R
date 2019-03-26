library(SmoothHazard)


### Name: summary.shr
### Title: Summary of a fitted survival model using a penalized likelihood
###   approach
### Aliases: summary.shr
### Keywords: methods

### ** Examples


## Not run: 
##D # a penalized survival model 
##D data(testdata)
##D library(prodlim)
##D fit.su <- shr(Hist(time=list(l,r),id)~cov,data=testdata,method="Splines") 
##D summary(fit.su)
##D 
##D # Weibull survival model 
##D data(testdata)
##D fit.su <- shr(Hist(time=list(l,r),id)~cov,data=testdata) 
##D summary(fit.su) 
## End(Not run)



