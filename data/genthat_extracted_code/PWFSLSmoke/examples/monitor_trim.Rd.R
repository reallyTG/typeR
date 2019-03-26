library(PWFSLSmoke)


### Name: monitor_trim
### Title: Trim ws_monitor Time Axis to Remove NA Periods From Beginning
###   and End
### Aliases: monitor_trim
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D sm13 <- wrcc_createMonitorObject(20150101, 20151231, unitID='sm13')
##D sm13$meta[,c('stateCode','countyName','siteName','monitorID')]
##D Deschutes <- monitor_subset(sm13, monitorIDs='lon_.121.453_lat_43.878_wrcc.sm13')
##D Deschutes <- monitor_trim(Deschutes)
##D monitorPlot_dailyBarplot(Deschutes)
## End(Not run)



