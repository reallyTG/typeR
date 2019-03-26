library(PWFSLSmoke)


### Name: monitor_dailyStatistic
### Title: Calculate Daily Statistics
### Aliases: monitor_dailyStatistic
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D N_M <- monitor_subset(Northwest_Megafires, tlim=c(20150801,20150831))
##D WinthropID <- '530470010_01'
##D TwispID <- '530470009_01'
##D MethowValley <- monitor_subset(N_M, tlim=c(20150801,20150831), monitorIDs=c(WinthropID,TwispID))
##D MethowValley_dailyMean <- monitor_dailyStatistic(MethowValley, FUN=get('mean'), dayStart='midnight')
##D # Get the full Y scale
##D monitorPlot_timeseries(MethowValley, style='gnats', col='transparent')
##D monitorPlot_timeseries(MethowValley, style='gnats', monitorID=TwispID,
##D                        col='forestgreen', add=TRUE)
##D monitorPlot_timeseries(MethowValley, style='gnats', monitorID=WinthropID,
##D                        col='purple', add=TRUE)
##D monitorPlot_timeseries(MethowValley_dailyMean, type='s', lwd=2, monitorID=TwispID,
##D                        col='forestgreen', add=TRUE)
##D monitorPlot_timeseries(MethowValley_dailyMean, type='s', lwd=2, monitorID=WinthropID,
##D                        col='purple', add=TRUE)
##D addAQILines()
##D addAQILegend("topleft", lwd=1, pch=NULL)
##D title("Winthrop & Twisp, Washington Daily Mean PM2.5, 2015")
## End(Not run)



