library(imputeR)


### Name: CubistR
### Title: Cubist method for imputation
### Aliases: CubistR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "CubistR")
## End(No test)



