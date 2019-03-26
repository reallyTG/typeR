library(gppm)


### Name: vcov.GPPM
### Title: Variance-Covariance Matrix
### Aliases: vcov.GPPM

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
covMat <- vcov(lgcmFit)
## End(No test)



