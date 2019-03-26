library(imputeR)


### Name: gbmC
### Title: boosting tree for imputation
### Aliases: gbmC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "gbmC")
## End(No test)



