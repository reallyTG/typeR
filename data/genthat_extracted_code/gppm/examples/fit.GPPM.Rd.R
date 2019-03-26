library(gppm)


### Name: fit.GPPM
### Title: Fit a Gaussian process panel model
### Aliases: fit.GPPM

### ** Examples

## No test: 
#regular usage
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)

#starting values as ML results
startVals <- c(10,1,10,3,10,1)
names(startVals) <- pars(lgcm)
lgcmFakeFit <- fit(lgcm,init=startVals,useOptimizer=FALSE)
stopifnot(identical(startVals,coef(lgcmFakeFit)))
## End(No test)



