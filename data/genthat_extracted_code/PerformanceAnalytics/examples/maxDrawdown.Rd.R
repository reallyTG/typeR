library(PerformanceAnalytics)


### Name: maxDrawdown
### Title: caclulate the maximum drawdown from peak equity
### Aliases: maxDrawdown

### ** Examples


data(edhec)
t(round(maxDrawdown(edhec[,"Funds of Funds"]),4))
data(managers)
t(round(maxDrawdown(managers),4))




