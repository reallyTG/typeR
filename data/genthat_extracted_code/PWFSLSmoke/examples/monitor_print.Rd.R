library(PWFSLSmoke)


### Name: monitor_print
### Title: Print Monitor Data as CSV
### Aliases: monitor_print
### Keywords: ws_monitor

### ** Examples

data("Carmel_Valley")
Carmel_Valley <- monitor_subset(Carmel_Valley, tlim=c(20160802,20160803))
monitor_print(Carmel_Valley)
monitor_print(Carmel_Valley, metaOnly = TRUE)
monitor_print(Carmel_Valley, dataOnly = TRUE)



