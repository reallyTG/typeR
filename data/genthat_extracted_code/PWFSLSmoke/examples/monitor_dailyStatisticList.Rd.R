library(PWFSLSmoke)


### Name: monitor_dailyStatisticList
### Title: Calculate Daily Statistics
### Aliases: monitor_dailyStatisticList
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D airnow <- airnow_loadLatest()
##D nw <- monitor_subset(airnow, stateCodes = c('WA','OR','ID','MT'))
##D dailyList <- monitor_dailyStatisticList(nw)
##D monitorLeaflet(dailyList[["America/Los_Angeles"]])
##D monitorLeaflet(dailyList[["America/Boise"]])
##D monitorLeaflet(dailyList[["America/Denver"]])
## End(Not run)



