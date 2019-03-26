library(imputeR)


### Name: rpartC
### Title: classification tree for imputation
### Aliases: rpartC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "rpartC")
## End(No test)



