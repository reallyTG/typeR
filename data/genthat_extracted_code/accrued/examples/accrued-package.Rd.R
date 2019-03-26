library(accrued)


### Name: accrued-package
### Title: Data Quality Visualization Tools for Partially Accruing Data
### Aliases: accrued-package accrued
### Keywords: package

### ** Examples

data(accruedDataExample)
testData <- data.accrued(accruedDataExample)
plot(testData)
summary(testData)
plot(summary(testData))
uploadPattern(testData)
laggedTSarray(testData, lags=c(1,3,5,7) )
lagHistogram(testData)
summary(accruedErrors(testData))
plot(accruedErrors(testData))
currentValues = asOf(testData, currentDate=20)
# plot(currentValues)

data(accruedDataILIExample)
testData2 <- data.accrued(accruedDataILIExample)
plot(accruedErrors(testData, testData2))



