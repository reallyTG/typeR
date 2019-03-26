library(PerformanceAnalytics)


### Name: chart.RelativePerformance
### Title: relative performance chart between multiple return series
### Aliases: chart.RelativePerformance

### ** Examples


data(managers)
chart.RelativePerformance(managers[, 1:6, drop=FALSE], 
		managers[, 8, drop=FALSE], 
		colorset=rich8equal, legend.loc="bottomright", 
		main="Relative Performance to S&P")




