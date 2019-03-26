library(SmoothHazard)


### Name: shr
### Title: Fit a survival model
### Aliases: shr
### Keywords: methods

### ** Examples


# Weibull survival model
library(prodlim)
data(testdata)
fit.su <- shr(Hist(time=list(l,r),id)~cov,data=testdata) 
fit.su
summary(fit.su)
## Not run: 
##D shr.spline <- shr(Hist(time=list(l,r),id)~cov,data=testdata,method="splines",n.knots=6)
##D shr.spline
##D shr.spline.q <- shr(Hist(time=list(l,r),id)~cov,data=testdata,
##D                     method="splines",n.knots=6,knots="quantiles")
##D plot(shr.spline.q)
##D 
##D ## manual placement of knots
##D shr.spline.man <- shr(Hist(time=list(l,r),id)~cov,data=testdata,method="splines",knots=seq(0,7,1))
## End(Not run)



