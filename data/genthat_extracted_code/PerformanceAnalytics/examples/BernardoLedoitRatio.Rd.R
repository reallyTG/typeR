library(PerformanceAnalytics)


### Name: BernardoLedoitRatio
### Title: Bernardo and Ledoit ratio of the return distribution
### Aliases: BernardoLedoitRatio

### ** Examples

data(portfolio_bacon)
print(BernardoLedoitRatio(portfolio_bacon[,1])) #expected 1.78

data(managers)
print(BernardoLedoitRatio(managers['1996']))
print(BernardoLedoitRatio(managers['1996',1])) #expected 4.598




