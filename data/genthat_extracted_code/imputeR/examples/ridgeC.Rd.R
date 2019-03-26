library(imputeR)


### Name: ridgeC
### Title: Ridge regression with lasso for imputation
### Aliases: ridgeC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "ridgeC")
## End(No test)



