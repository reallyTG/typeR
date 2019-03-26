library(gppm)


### Name: covf
### Title: Covariance Function
### Aliases: covf

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
myCov <- covf(lgcm)
## End(No test)



