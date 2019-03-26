library(imputeR)


### Name: stepForC
### Title: Best subset for classification (forward direction)
### Aliases: stepForC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "stepForC")
## End(No test)



