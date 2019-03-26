library(PerformanceAnalytics)


### Name: chart.Regression
### Title: Takes a set of returns and relates them to a market benchmark in
###   a scatterplot
### Aliases: chart.Regression

### ** Examples


data(managers)
chart.Regression(managers[, 1:2, drop = FALSE], 
		managers[, 8, drop = FALSE], 
		Rf = managers[, 10, drop = FALSE], 
		excess.returns = TRUE, fit = c("loess", "linear"), 
		legend.loc = "topleft")




