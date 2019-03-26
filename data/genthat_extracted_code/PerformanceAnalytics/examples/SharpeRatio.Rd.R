library(PerformanceAnalytics)


### Name: SharpeRatio
### Title: calculate a traditional or modified Sharpe Ratio of Return over
###   StdDev or VaR or ES
### Aliases: SharpeRatio SharpeRatio.modified SharpeRatio.modified

### ** Examples


data(managers)
SharpeRatio(managers[,1,drop=FALSE], Rf=.035/12, FUN="StdDev") 
SharpeRatio(managers[,1,drop=FALSE], Rf = managers[,10,drop=FALSE], FUN="StdDev")
SharpeRatio(managers[,1:6], Rf=.035/12, FUN="StdDev") 
SharpeRatio(managers[,1:6], Rf = managers[,10,drop=FALSE], FUN="StdDev")



data(edhec)
SharpeRatio(edhec[, 6, drop = FALSE], FUN="VaR")
SharpeRatio(edhec[, 6, drop = FALSE], Rf = .04/12, FUN="VaR")
SharpeRatio(edhec[, 6, drop = FALSE], Rf = .04/12, FUN="VaR" , method="gaussian")
SharpeRatio(edhec[, 6, drop = FALSE], FUN="ES")

# and all the methods
SharpeRatio(managers[,1:9], Rf = managers[,10,drop=FALSE])
SharpeRatio(edhec,Rf = .04/12)




