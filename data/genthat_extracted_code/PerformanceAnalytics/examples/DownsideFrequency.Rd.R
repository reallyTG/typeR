library(PerformanceAnalytics)


### Name: DownsideFrequency
### Title: downside frequency of the return distribution
### Aliases: DownsideFrequency

### ** Examples

data(portfolio_bacon)
MAR = 0.005
print(DownsideFrequency(portfolio_bacon[,1], MAR)) #expected 0.458

data(managers)
print(DownsideFrequency(managers['1996']))
print(DownsideFrequency(managers['1996',1])) #expected 0.25




