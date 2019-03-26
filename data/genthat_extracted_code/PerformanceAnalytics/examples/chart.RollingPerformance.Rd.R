library(PerformanceAnalytics)


### Name: chart.RollingPerformance
### Title: wrapper to create a chart of rolling performance metrics in a
###   line chart
### Aliases: chart.RollingPerformance

### ** Examples


data(edhec)
chart.RollingPerformance(edhec[, 1:3], width = 24)
chart.RollingPerformance(edhec[, 1:3], 
		FUN = 'mean', width = 24, colorset = rich8equal, 
		lwd = 2, legend.loc = "topleft", 
		main = "Rolling 24-Month Mean Return")
chart.RollingPerformance(edhec[, 1:3], 
		FUN = 'SharpeRatio.annualized', width = 24, 
		colorset = rich8equal, lwd = 2, legend.loc = "topleft", 
		main = "Rolling 24-Month Sharpe Ratio")




