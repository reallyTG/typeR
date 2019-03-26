library(PerformanceAnalytics)


### Name: UpsideFrequency
### Title: upside frequency of the return distribution
### Aliases: UpsideFrequency

### ** Examples

data(portfolio_bacon)
MAR = 0.005
print(UpsideFrequency(portfolio_bacon[,1], MAR)) #expected 0.542

data(managers)
print(UpsideFrequency(managers['1996']))
print(UpsideFrequency(managers['1996',1])) #expected 0.75




