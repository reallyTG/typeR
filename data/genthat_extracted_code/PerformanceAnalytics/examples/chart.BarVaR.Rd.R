library(PerformanceAnalytics)


### Name: chart.BarVaR
### Title: Periodic returns in a bar chart with risk metric overlay
### Aliases: chart.BarVaR charts.BarVaR charts.BarVaR

### ** Examples

## Not run: 
##D  # not run on CRAN because of example time
##D data(managers)
##D # plain
##D chart.BarVaR(managers[,1,drop=FALSE], main="Monthly Returns")
##D 
##D # with risk line
##D chart.BarVaR(managers[,1,drop=FALSE], 
##D 		methods="HistoricalVaR", 
##D 		main="... with Empirical VaR from Inception")
##D 		
##D # with lines for all managers in the sample
##D chart.BarVaR(managers[,1:6], 
##D 		methods="GaussianVaR", 
##D 		all=TRUE, lty=1, lwd=2, 
##D 		colorset= c("red", rep("gray", 5)), 
##D 		main="... with Gaussian VaR and Estimates for Peers")
##D 
##D # with multiple methods
##D chart.BarVaR(managers[,1,drop=FALSE],
##D 		methods=c("HistoricalVaR", "ModifiedVaR", "GaussianVaR"), 
##D 		main="... with Multiple Methods")
##D 
##D # cleaned up a bit
##D chart.BarVaR(managers[,1,drop=FALSE],
##D 		methods=c("HistoricalVaR", "ModifiedVaR", "GaussianVaR"), 
##D 		lwd=2, ypad=.01, 
##D 		main="... with Padding for Bottom Legend")
##D 
##D # with 'cleaned' data for VaR estimates
##D chart.BarVaR(managers[,1,drop=FALSE],
##D 		methods=c("HistoricalVaR", "ModifiedVaR"), 
##D 		lwd=2, ypad=.01, clean="boudt", 
##D 		main="... with Robust ModVaR Estimate")
##D 
##D # Cornish Fisher VaR estimated with cleaned data, 
##D # with horizontal line to show exceptions
##D chart.BarVaR(managers[,1,drop=FALSE],
##D 		methods="ModifiedVaR", 
##D 		lwd=2, ypad=.01, clean="boudt", 
##D 		show.horizontal=TRUE, lty=2, 
##D 		main="... with Robust ModVaR and Line for Identifying Exceptions")
## End(Not run)




