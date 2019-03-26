library(wqs)


### Name: wqs.est
### Title: Weighted Quantile Sum Regression
### Aliases: wqs.est
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(WQSdata)
y.train <- WQSdata[,'y']
x.train <- WQSdata[,-10]
output <- wqs.est(y.train, x.train, B = 10)



