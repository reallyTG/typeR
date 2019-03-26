library(PWFSLSmoke)


### Name: monitor_isolate
### Title: Isolate Individual Monitors
### Aliases: monitor_isolate
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
# monitorLeaflet(N_M) # to identify Spokane monitorIDs
Spokane <- monitor_subsetBy(N_M, stringr::str_detect(N_M$meta$monitorID,'^53063'))
Spokane$meta$monitorID
monitorList <- monitor_isolate(Spokane)
names(monitorList)



