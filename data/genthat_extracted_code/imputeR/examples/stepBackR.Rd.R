library(imputeR)


### Name: stepBackR
### Title: Best subset (backward direction) for regression
### Aliases: stepBackR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "stepBackR")
## End(No test)



