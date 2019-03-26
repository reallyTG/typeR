library(gppm)


### Name: parEsts
### Title: Essential Parameter Estimation Results
### Aliases: parEsts

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
paramEssentials <- parEsts(lgcmFit)
## End(No test)



