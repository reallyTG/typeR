library(imputeR)


### Name: glmboostR
### Title: Boosting for regression
### Aliases: glmboostR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "glmboostR")
## End(No test)



