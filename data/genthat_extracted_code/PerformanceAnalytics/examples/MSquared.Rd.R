library(PerformanceAnalytics)


### Name: MSquared
### Title: M squared of the return distribution
### Aliases: MSquared

### ** Examples


data(portfolio_bacon)
print(MSquared(portfolio_bacon[,1], portfolio_bacon[,2])) #expected 0.10062

data(managers)
print(MSquared(managers['1996',1], managers['1996',8]))
print(MSquared(managers['1996',1:5], managers['1996',8]))




