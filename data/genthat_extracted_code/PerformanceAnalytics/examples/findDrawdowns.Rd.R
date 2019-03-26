library(PerformanceAnalytics)


### Name: Drawdowns
### Title: Find the drawdowns and drawdown levels in a timeseries.
### Aliases: Drawdowns findDrawdowns Drawdowns

### ** Examples


data(edhec)
findDrawdowns(edhec[,"Funds of Funds", drop=FALSE])
sortDrawdowns(findDrawdowns(edhec[,"Funds of Funds", drop=FALSE]))




