library(wqs)


### Name: wqs-package
### Title: Weighted Quantile Sum Regression
### Aliases: wqs-package wqs
### Keywords: package

### ** Examples

data(WQSdata)
y.train <- WQSdata[,'y']
x.train <- WQSdata[,-10]
output <- wqs.est(y.train, x.train, B = 10)



