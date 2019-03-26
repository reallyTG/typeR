library(imputeR)


### Name: rdaC
### Title: regularised LDA method for imputation
### Aliases: rdaC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "rdaC")
## End(No test)



