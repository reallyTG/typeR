library(PerformanceAnalytics)


### Name: SkewnessKurtosisRatio
### Title: Skewness-Kurtosis ratio of the return distribution
### Aliases: SkewnessKurtosisRatio Skewness-KurtosisRatio

### ** Examples


data(portfolio_bacon)
print(SkewnessKurtosisRatio(portfolio_bacon[,1])) #expected -0.034

data(managers)
print(SkewnessKurtosisRatio(managers['1996']))
print(SkewnessKurtosisRatio(managers['1996',1]))




