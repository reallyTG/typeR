library(PerformanceAnalytics)


### Name: chart.Drawdown
### Title: Time series chart of drawdowns through time
### Aliases: chart.Drawdown

### ** Examples


data(edhec)
chart.Drawdown(edhec[,c(1,2)], 
		main="Drawdown from Peak Equity Attained", 
		legend.loc="bottomleft")



