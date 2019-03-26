library(gppm)


### Name: confint.GPPM
### Title: Confidence Intervals
### Aliases: confint.GPPM

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
confInts <- confint(lgcmFit)
## End(No test)



