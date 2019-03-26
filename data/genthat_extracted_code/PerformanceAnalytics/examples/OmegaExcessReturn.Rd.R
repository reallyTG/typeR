library(PerformanceAnalytics)


### Name: OmegaExcessReturn
### Title: Omega excess return of the return distribution
### Aliases: OmegaExcessReturn OmegaExessReturn

### ** Examples


data(portfolio_bacon)
MAR = 0.005
print(OmegaExcessReturn(portfolio_bacon[,1], portfolio_bacon[,2], MAR)) #expected 0.0805

data(managers)
MAR = 0
print(OmegaExcessReturn(managers['1996',1], managers['1996',8], MAR))
print(OmegaExcessReturn(managers['1996',1:5], managers['1996',8], MAR))




