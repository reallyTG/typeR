library(SmoothHazard)


### Name: plot.shr
### Title: Plot method for a survival model.
### Aliases: plot.shr
### Keywords: methods

### ** Examples


# Weibull survival model
library(prodlim)
data(testdata)
fit.su <- shr(Hist(time=list(l,r),id)~cov,data=testdata) 

# pointwise confidence limits
plot(fit.su)

# no pointwise confidence limits
plot(fit.su,confint=FALSE)





