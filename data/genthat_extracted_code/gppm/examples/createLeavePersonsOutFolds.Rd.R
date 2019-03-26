library(gppm)


### Name: createLeavePersonsOutFolds
### Title: Create Leave-persons-out Folds
### Aliases: createLeavePersonsOutFolds

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
theFolds <- createLeavePersonsOutFolds(lgcm)
## End(No test)




