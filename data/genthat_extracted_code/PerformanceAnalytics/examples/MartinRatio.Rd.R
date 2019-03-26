library(PerformanceAnalytics)


### Name: MartinRatio
### Title: Martin ratio of the return distribution
### Aliases: MartinRatio

### ** Examples

data(portfolio_bacon)
print(MartinRatio(portfolio_bacon[,1])) #expected 1.70

data(managers)
print(MartinRatio(managers['1996']))
print(MartinRatio(managers['1996',1])) 




