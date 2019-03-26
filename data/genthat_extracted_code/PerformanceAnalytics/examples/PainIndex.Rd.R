library(PerformanceAnalytics)


### Name: PainIndex
### Title: Pain index of the return distribution
### Aliases: PainIndex

### ** Examples

data(portfolio_bacon)
print(PainIndex(portfolio_bacon[,1])) #expected 0.04

data(managers)
print(PainIndex(100*managers['1996']))
print(PainIndex(100*managers['1996',1])) 




