library(PerformanceAnalytics)


### Name: Selectivity
### Title: Selectivity of the return distribution
### Aliases: Selectivity

### ** Examples


data(portfolio_bacon)
print(Selectivity(portfolio_bacon[,1], portfolio_bacon[,2])) #expected -0.0141

data(managers)
print(Selectivity(managers['1996',1], managers['1996',8]))
print(Selectivity(managers['1996',1:5], managers['1996',8]))




