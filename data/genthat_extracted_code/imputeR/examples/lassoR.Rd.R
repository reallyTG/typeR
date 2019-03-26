library(imputeR)


### Name: lassoR
### Title: LASSO for regression
### Aliases: lassoR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "lassoR")
## End(No test)



