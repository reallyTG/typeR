library(gppm)


### Name: SE
### Title: Standard Errors
### Aliases: SE

### ** Examples

## No test: 
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
stdErrors <- SE(lgcmFit)
## End(No test)



