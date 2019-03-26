library(PerformanceAnalytics)


### Name: chart.Events
### Title: Plots a time series with event dates aligned
### Aliases: chart.Events

### ** Examples

## Not run: 
##D data(managers)
##D n = table.Drawdowns(managers[,2,drop=FALSE])                          
##D chart.Events(Drawdowns(managers[,2,drop=FALSE]), 
##D 		dates = n$Trough, 
##D 		prior=max(na.omit(n$"To Trough")), 
##D 		post=max(na.omit(n$Recovery)), 
##D 		lwd=2, colorset=redfocus, legend.loc=NULL, 
##D 		main = "Worst Drawdowns")
## End(Not run)



