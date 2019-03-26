library(PerformanceAnalytics)


### Name: SharpeRatio.annualized
### Title: calculate annualized Sharpe Ratio
### Aliases: SharpeRatio.annualized

### ** Examples


data(managers)
SharpeRatio.annualized(managers[,1,drop=FALSE], Rf=.035/12) 
SharpeRatio.annualized(managers[,1,drop=FALSE], Rf = managers[,10,drop=FALSE])
SharpeRatio.annualized(managers[,1:6], Rf=.035/12) 
SharpeRatio.annualized(managers[,1:6], Rf = managers[,10,drop=FALSE])
SharpeRatio.annualized(managers[,1:6], Rf = managers[,10,drop=FALSE],geometric=FALSE)




