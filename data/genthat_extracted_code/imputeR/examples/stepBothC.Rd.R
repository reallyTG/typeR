library(imputeR)


### Name: stepBothC
### Title: Best subset for classification (both direction)
### Aliases: stepBothC

### ** Examples

data(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
impdata <- impute(spect, cFun = "stepBothC")
## End(No test)



