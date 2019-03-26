library(gppm)


### Name: coef.GPPM
### Title: Point Estimates
### Aliases: coef.GPPM

### ** Examples

## No test: 
 data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
paraEsts <- coef(lgcmFit)
## End(No test)



