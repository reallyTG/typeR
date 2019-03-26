library(PerformanceAnalytics)


### Name: TotalRisk
### Title: Total risk of the return distribution
### Aliases: TotalRisk

### ** Examples


data(portfolio_bacon)
print(TotalRisk(portfolio_bacon[,1], portfolio_bacon[,2])) #expected 0.0134

data(managers)
print(TotalRisk(managers['1996',1], managers['1996',8]))
print(TotalRisk(managers['1996',1:5], managers['1996',8]))




