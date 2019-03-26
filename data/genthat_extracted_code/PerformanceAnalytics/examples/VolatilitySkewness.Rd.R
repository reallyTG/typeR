library(PerformanceAnalytics)


### Name: VolatilitySkewness
### Title: Volatility and variability of the return distribution
### Aliases: VolatilitySkewness

### ** Examples


data(portfolio_bacon)
MAR = 0.005
print(VolatilitySkewness(portfolio_bacon[,1], MAR, stat="volatility")) #expected 1.32
print(VolatilitySkewness(portfolio_bacon[,1], MAR, stat="variability")) #expected 1.15

MAR = 0
data(managers)
# print(VolatilitySkewness(managers['1996'], MAR, stat="volatility"))
print(VolatilitySkewness(managers['1996',1], MAR, stat="volatility"))




