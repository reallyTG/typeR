library(gppm)


### Name: logLik.GPPM
### Title: Log-Likelihood
### Aliases: logLik.GPPM

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
ll <- logLik(lgcmFit)
## End(No test)



