library(PerformanceAnalytics)


### Name: AdjustedSharpeRatio
### Title: Adjusted Sharpe ratio of the return distribution
### Aliases: AdjustedSharpeRatio

### ** Examples

data(portfolio_bacon)
print(AdjustedSharpeRatio(portfolio_bacon[,1])) #expected 0.7591435

data(managers)
print(AdjustedSharpeRatio(managers['1996']))



