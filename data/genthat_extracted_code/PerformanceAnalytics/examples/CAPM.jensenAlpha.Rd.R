library(PerformanceAnalytics)


### Name: CAPM.jensenAlpha
### Title: Jensen's alpha of the return distribution
### Aliases: CAPM.jensenAlpha SFM.jensenAlpha

### ** Examples


data(portfolio_bacon)
print(SFM.jensenAlpha(portfolio_bacon[,1], portfolio_bacon[,2])) #expected -0.014

data(managers)
print(SFM.jensenAlpha(managers['1996',1], managers['1996',8]))
print(SFM.jensenAlpha(managers['1996',1:5], managers['1996',8]))




