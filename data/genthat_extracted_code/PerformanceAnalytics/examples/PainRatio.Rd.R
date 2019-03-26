library(PerformanceAnalytics)


### Name: PainRatio
### Title: Pain ratio of the return distribution
### Aliases: PainRatio

### ** Examples

data(portfolio_bacon)
print(PainRatio(portfolio_bacon[,1])) #expected 2.66

data(managers)
print(PainRatio(managers['1996']))
print(PainRatio(managers['1996',1])) 




