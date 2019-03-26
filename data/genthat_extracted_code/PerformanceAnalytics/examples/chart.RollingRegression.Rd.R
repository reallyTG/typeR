library(PerformanceAnalytics)


### Name: chart.RollingQuantileRegression
### Title: A wrapper to create charts of relative regression performance
###   through time
### Aliases: chart.RollingQuantileRegression chart.RollingRegression
###   chart.RollingQuantileRegression charts.RollingRegression
###   charts.RollingRegression

### ** Examples


# First we load the data
data(managers)
chart.RollingRegression(managers[, 1, drop=FALSE], 
		managers[, 8, drop=FALSE], Rf = .04/12)
charts.RollingRegression(managers[, 1:6], 
		managers[, 8, drop=FALSE], Rf = .04/12, 
		colorset = rich6equal, legend.loc="topleft")
dev.new()
chart.RollingQuantileRegression(managers[, 1, drop=FALSE], 
		managers[, 8, drop=FALSE], Rf = .04/12)
# not implemented yet
#charts.RollingQuantileRegression(managers[, 1:6], 
#		managers[, 8, drop=FALSE], Rf = .04/12, 
#		colorset = rich6equal, legend.loc="topleft")




