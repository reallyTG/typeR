library(PerformanceAnalytics)


### Name: chart.CumReturns
### Title: Cumulates and graphs a set of periodic returns
### Aliases: chart.CumReturns

### ** Examples


data(edhec)
chart.CumReturns(edhec[,"Funds of Funds"],main="Cumulative Returns")
chart.CumReturns(edhec[,"Funds of Funds"],wealth.index=TRUE, main="Growth of $1")
data(managers)
chart.CumReturns(managers,main="Cumulative Returns",begin="first")
chart.CumReturns(managers,main="Cumulative Returns",begin="axis")




