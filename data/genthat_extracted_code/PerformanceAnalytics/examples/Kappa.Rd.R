library(PerformanceAnalytics)


### Name: Kappa
### Title: Kappa of the return distribution
### Aliases: Kappa

### ** Examples

l = 2

data(portfolio_bacon)
MAR = 0.005
print(Kappa(portfolio_bacon[,1], MAR, l)) #expected 0.157

data(managers)
MAR = 0
print(Kappa(managers['1996'], MAR, l))
print(Kappa(managers['1996',1], MAR, l)) #expected 1.493




