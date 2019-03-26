library(PerformanceAnalytics)


### Name: UpsideRisk
### Title: upside risk, variance and potential of the return distribution
### Aliases: UpsideRisk

### ** Examples


data(portfolio_bacon)
MAR = 0.005
print(UpsideRisk(portfolio_bacon[,1], MAR, stat="risk")) #expected 0.02937
print(UpsideRisk(portfolio_bacon[,1], MAR, stat="variance")) #expected 0.08628
print(UpsideRisk(portfolio_bacon[,1], MAR, stat="potential")) #expected 0.01771

MAR = 0
data(managers)
print(UpsideRisk(managers['1996'], MAR, stat="risk"))
print(UpsideRisk(managers['1996',1], MAR, stat="risk")) #expected 1.820




