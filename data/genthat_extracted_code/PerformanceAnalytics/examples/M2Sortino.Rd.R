library(PerformanceAnalytics)


### Name: M2Sortino
### Title: M squared for Sortino of the return distribution
### Aliases: M2Sortino

### ** Examples


data(portfolio_bacon)
MAR = 0.005
print(M2Sortino(portfolio_bacon[,1], portfolio_bacon[,2], MAR)) #expected 0.1035

data(managers)
MAR = 0
print(MSquaredExcess(managers['1996',1], managers['1996',8], MAR))
print(MSquaredExcess(managers['1996',1:5], managers['1996',8], MAR))




