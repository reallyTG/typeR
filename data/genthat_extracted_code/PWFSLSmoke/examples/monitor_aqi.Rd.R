library(PWFSLSmoke)


### Name: monitor_aqi
### Title: Calculate hourly NowCast-based AQI values
### Aliases: monitor_aqi
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D ws_monitor <- monitor_subset(Northwest_Megafires, tlim=c(20150815,20150831))
##D aqi <- monitor_aqi(ws_monitor)
##D monitorPlot_timeseries(aqi, monitorID=aqi$meta$monitorID[1], ylab="PM25 AQI")
## End(Not run)



