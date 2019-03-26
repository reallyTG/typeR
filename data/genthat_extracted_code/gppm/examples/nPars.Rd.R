library(gppm)


### Name: nPars
### Title: Number of Parameters
### Aliases: nPars

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
numberParas <- nPars(lgcm)
## End(No test)



