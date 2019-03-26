library(PerformanceAnalytics)


### Name: OmegaSharpeRatio
### Title: Omega-Sharpe ratio of the return distribution
### Aliases: OmegaSharpeRatio

### ** Examples


data(portfolio_bacon)
MAR = 0.005
print(OmegaSharpeRatio(portfolio_bacon[,1], MAR)) #expected 0.29

MAR = 0
data(managers)
print(OmegaSharpeRatio(managers['1996'], MAR))
print(OmegaSharpeRatio(managers['1996',1], MAR)) #expected 3.60




