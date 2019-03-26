library(imputeR)


### Name: stepBackC
### Title: Best subset for classification (backward)
### Aliases: stepBackC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "stepBackC")
## End(No test)



