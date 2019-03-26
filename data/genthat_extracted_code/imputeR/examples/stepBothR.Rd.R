library(imputeR)


### Name: stepBothR
### Title: Best subset for regression (both direction)
### Aliases: stepBothR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "stepBothR")
## End(No test)



