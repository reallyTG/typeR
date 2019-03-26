library(PerformanceAnalytics)


### Name: BurkeRatio
### Title: Burke ratio of the return distribution
### Aliases: BurkeRatio

### ** Examples

data(portfolio_bacon)
print(BurkeRatio(portfolio_bacon[,1])) #expected 0.74
print(BurkeRatio(portfolio_bacon[,1], modified = TRUE)) #expected 3.65

data(managers)
print(BurkeRatio(managers['1996']))
print(BurkeRatio(managers['1996',1])) 
print(BurkeRatio(managers['1996'], modified = TRUE))
print(BurkeRatio(managers['1996',1], modified = TRUE)) 




