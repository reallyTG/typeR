library(PWFSLSmoke)


### Name: monitor_nowcast
### Title: Apply Nowcast Algorithm to ws_monitor Object
### Aliases: monitor_nowcast
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D N_M <- monitor_subset(Northwest_Megafires, tlim=c(20150815,20150831))
##D Omak <- monitor_subset(N_M, monitorIDs='530470013_01')
##D Omak_nowcast <- monitor_nowcast(Omak, includeShortTerm=TRUE)
##D monitorPlot_timeseries(Omak, type='l', lwd=2)
##D monitorPlot_timeseries(Omak_nowcast, add=TRUE, type='l', col='purple', lwd=2)
##D addAQILines()
##D addAQILegend(lwd=1, pch=NULL)
##D legend("topleft", lwd=2, col=c('black','purple'), legend=c('hourly','nowcast'))
##D title("Omak, Washington Hourly and Nowcast PM2.5 Values in August, 2015")
##D # Zooming in to check on handling of missing values
##D monitorPlot_timeseries(Omak, tlim=c(20150823,20150825))
##D monitorPlot_timeseries(Omak_nowcast, tlim=c(20150823,20150825), pch=16,col='red',type='b', add=TRUE)
##D abline(v=Omak$data[is.na(Omak$data[,2]),1])
##D title("Missing values")
## End(Not run)



