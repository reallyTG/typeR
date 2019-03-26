library(PWFSLSmoke)


### Name: monitor_combine
### Title: Combine List of ws_monitor Objects into Single ws_monitor Object
### Aliases: monitor_combine
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D monitorList <- list()
##D monitorList[[1]] <- airsis_createMonitorObject(20160701, 20161231, 'USFS', '1031')
##D monitorList[[2]] <- airsis_createMonitorObject(20160701, 20161231, 'USFS', '1032')
##D monitorList[[3]] <- airsis_createMonitorObject(20160701, 20161231, 'USFS', '1033')
##D monitorList[[4]] <- airsis_createMonitorObject(20160701, 20161231, 'USFS', '1034')
##D ws_monitor <- monitor_combine(monitorList)
##D monitorLeaflet(ws_monitor)
## End(Not run)



