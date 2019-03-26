library(PerformanceAnalytics)


### Name: sortDrawdowns
### Title: order list of drawdowns from worst to best
### Aliases: sortDrawdowns

### ** Examples


data(edhec)
findDrawdowns(edhec[,"Funds of Funds", drop=FALSE])
sortDrawdowns(findDrawdowns(edhec[,"Funds of Funds", drop=FALSE]))




