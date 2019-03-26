library(PerformanceAnalytics)


### Name: DRatio
### Title: d ratio of the return distribution
### Aliases: DRatio

### ** Examples

data(portfolio_bacon)
print(DRatio(portfolio_bacon[,1])) #expected 0.401

data(managers)
print(DRatio(managers['1996']))
print(DRatio(managers['1996',1])) #expected 0.0725




