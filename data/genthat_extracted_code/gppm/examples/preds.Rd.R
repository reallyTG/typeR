library(gppm)


### Name: preds
### Title: Predictors Names
### Aliases: preds

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
myPreds <- preds(lgcm)
## End(No test)



