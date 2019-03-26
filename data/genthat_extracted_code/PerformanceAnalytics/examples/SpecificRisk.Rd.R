library(PerformanceAnalytics)


### Name: SpecificRisk
### Title: Specific risk of the return distribution
### Aliases: SpecificRisk

### ** Examples


data(portfolio_bacon)
print(SpecificRisk(portfolio_bacon[,1], portfolio_bacon[,2])) #expected 0.0329

data(managers)
print(SpecificRisk(managers['1996',1], managers['1996',8]))
print(SpecificRisk(managers['1996',1:5], managers['1996',8]))




