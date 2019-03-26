library(gppm)


### Name: crossvalidate
### Title: Cross-validation.
### Aliases: crossvalidate

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
theFolds <- createLeavePersonsOutFolds(lgcm,k=2) #for speed, in practive rather use default k=10
crosRes <- crossvalidate(lgcm,theFolds)
crosRes$MSE #mean squared error
crosRes$nLPP #negative log-predictive probability
## End(No test)



