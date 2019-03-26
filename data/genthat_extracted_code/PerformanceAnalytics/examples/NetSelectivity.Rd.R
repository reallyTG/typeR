library(PerformanceAnalytics)


### Name: NetSelectivity
### Title: Net selectivity of the return distribution
### Aliases: NetSelectivity

### ** Examples


data(portfolio_bacon)
print(NetSelectivity(portfolio_bacon[,1], portfolio_bacon[,2])) #expected -0.017

data(managers)
print(NetSelectivity(managers['1996',1], managers['1996',8]))
print(NetSelectivity(managers['1996',1:5], managers['1996',8]))




