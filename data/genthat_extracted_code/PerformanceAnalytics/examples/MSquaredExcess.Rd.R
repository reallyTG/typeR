library(PerformanceAnalytics)


### Name: MSquaredExcess
### Title: M squared excess of the return distribution
### Aliases: MSquaredExcess

### ** Examples


data(portfolio_bacon)
MSquaredExcess(portfolio_bacon[,1], portfolio_bacon[,2]) #expected -0.00998

MSquaredExcess(portfolio_bacon[,1], portfolio_bacon[,2], Method="arithmetic") #expected -0.011

data(managers)
MSquaredExcess(managers['1996',1], managers['1996',8])
MSquaredExcess(managers['1996',1:5], managers['1996',8])




