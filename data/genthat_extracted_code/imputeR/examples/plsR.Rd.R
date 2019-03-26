library(imputeR)


### Name: plsR
### Title: Partial Least Square regression for imputation
### Aliases: plsR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "plsR")
## End(No test)



