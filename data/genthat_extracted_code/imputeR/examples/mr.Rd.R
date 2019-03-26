library(imputeR)


### Name: mr
### Title: calculate miss-classification error
### Aliases: mr

### ** Examples

data(spect)
Detect(spect)
missdata <- SimIm(spect, 0.1)
## No test: 
sum(is.na(missdata))
# impute using rpart
impdata <- impute(missdata, cFun = "rpartC")
# calculate the misclassification error
mr(impdata$imp, missdata, spect)
## End(No test)



