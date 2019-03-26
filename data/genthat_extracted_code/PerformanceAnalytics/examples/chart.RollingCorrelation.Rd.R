library(PerformanceAnalytics)


### Name: chart.RollingCorrelation
### Title: chart rolling correlation fo multiple assets
### Aliases: chart.RollingCorrelation

### ** Examples


# First we get the data
data(managers)
chart.RollingCorrelation(managers[, 1:6, drop=FALSE], 
		managers[, 8, drop=FALSE], 
		colorset=rich8equal, legend.loc="bottomright", 
		width=24, main = "Rolling 12-Month Correlation")




