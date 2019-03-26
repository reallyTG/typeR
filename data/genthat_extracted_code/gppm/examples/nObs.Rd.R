library(gppm)


### Name: nObs
### Title: Number of Observations
### Aliases: nObs

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
numberObs <-  nObs(lgcm)
## End(No test)



