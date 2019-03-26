library(PerformanceAnalytics)


### Name: MeanAbsoluteDeviation
### Title: Mean absolute deviation of the return distribution
### Aliases: MeanAbsoluteDeviation

### ** Examples

data(portfolio_bacon)
print(MeanAbsoluteDeviation(portfolio_bacon[,1])) #expected 0.0310

data(managers)
print(MeanAbsoluteDeviation(managers['1996']))
print(MeanAbsoluteDeviation(managers['1996',1]))




