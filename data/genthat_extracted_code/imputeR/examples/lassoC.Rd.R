library(imputeR)


### Name: lassoC
### Title: logistic regression with lasso for imputation
### Aliases: lassoC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "lassoC")
## End(No test)



