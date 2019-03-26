library(gppm)


### Name: getIntern
### Title: Generic Extraction Function
### Aliases: getIntern

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
getIntern(lgcmFit,'parsedmFormula')
## End(No test)



