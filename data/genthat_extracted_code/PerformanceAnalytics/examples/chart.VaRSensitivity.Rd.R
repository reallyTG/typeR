library(PerformanceAnalytics)


### Name: chart.VaRSensitivity
### Title: show the sensitivity of Value-at-Risk or Expected Shortfall
###   estimates
### Aliases: chart.VaRSensitivity

### ** Examples


data(managers)
chart.VaRSensitivity(managers[,1,drop=FALSE], 
		methods=c("HistoricalVaR", "ModifiedVaR", "GaussianVaR"), 
		colorset=bluefocus, lwd=2)




