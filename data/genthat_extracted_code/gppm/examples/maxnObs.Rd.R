library(gppm)


### Name: maxnObs
### Title: Maximum Number of Observations per Person
### Aliases: maxnObs

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
maxNumberObs <- maxnObs(lgcm)
## End(No test)



