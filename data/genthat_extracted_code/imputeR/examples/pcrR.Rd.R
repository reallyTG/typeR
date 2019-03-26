library(imputeR)


### Name: pcrR
### Title: Principle component regression for imputation
### Aliases: pcrR

### ** Examples

data(parkinson)
missdata <- SimIm(parkinson, 0.1)
## No test: 
impdata <- impute(missdata, lmFun = "pcrR")
## End(No test)



