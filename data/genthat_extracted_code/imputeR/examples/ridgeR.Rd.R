library(imputeR)


### Name: ridgeR
### Title: Ridge shrinkage for regression
### Aliases: ridgeR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "ridgeR")
## End(No test)



