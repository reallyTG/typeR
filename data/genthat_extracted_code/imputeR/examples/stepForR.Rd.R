library(imputeR)


### Name: stepForR
### Title: Best subset (forward direction) for regression
### Aliases: stepForR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "stepForR")
## End(No test)



