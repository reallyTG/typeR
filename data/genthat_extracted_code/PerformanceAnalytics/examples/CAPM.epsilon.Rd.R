library(PerformanceAnalytics)


### Name: CAPM.epsilon
### Title: Regression epsilon of the return distribution
### Aliases: CAPM.epsilon SFM.epsilon

### ** Examples


data(portfolio_bacon)
print(SFM.epsilon(portfolio_bacon[,1], portfolio_bacon[,2])) #expected -0.013

data(managers)
print(SFM.epsilon(managers['1996',1], managers['1996',8]))
print(SFM.epsilon(managers['1996',1:5], managers['1996',8]))




