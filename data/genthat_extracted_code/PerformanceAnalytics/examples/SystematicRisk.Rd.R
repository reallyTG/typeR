library(PerformanceAnalytics)


### Name: SystematicRisk
### Title: Systematic risk of the return distribution
### Aliases: SystematicRisk

### ** Examples


data(portfolio_bacon)
print(SystematicRisk(portfolio_bacon[,1], portfolio_bacon[,2])) #expected 0.013

data(managers)
print(SystematicRisk(managers['1996',1], managers['1996',8]))
print(SystematicRisk(managers['1996',1:5], managers['1996',8]))




