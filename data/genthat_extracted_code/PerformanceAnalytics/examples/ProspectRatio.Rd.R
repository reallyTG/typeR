library(PerformanceAnalytics)


### Name: ProspectRatio
### Title: Prospect ratio of the return distribution
### Aliases: ProspectRatio

### ** Examples

data(portfolio_bacon)
MAR = 0.05
print(ProspectRatio(portfolio_bacon[,1], MAR)) #expected -0.134

data(managers)
MAR = 0
print(ProspectRatio(managers['1996'], MAR))
print(ProspectRatio(managers['1996',1], MAR))




