library(gppm)


### Name: nPreds
### Title: Number of Predictors
### Aliases: nPreds

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
numberPreds <- nPreds(lgcm)
## End(No test)



