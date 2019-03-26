library(PerformanceAnalytics)


### Name: FamaBeta
### Title: Fama beta of the return distribution
### Aliases: FamaBeta

### ** Examples


data(portfolio_bacon)
print(FamaBeta(portfolio_bacon[,1], portfolio_bacon[,2])) #expected 1.03

data(managers)
print(FamaBeta(managers['1996',1], managers['1996',8]))
print(FamaBeta(managers['1996',1:5], managers['1996',8]))




