library(PWFSLSmoke)


### Name: monitor_isTidy
### Title: Check if data is tidy-formatted ws_monitor data
### Aliases: monitor_isTidy

### ** Examples

ws_monitor <- monitor_subset(
  Northwest_Megafires,
  monitorIDs = c('530470009_01', '530470010_01')
)

ws_monTidy <- monitor_toTidy(ws_monitor)
monitor_isTidy(ws_monTidy)

## Not run: 
##D monitor_isTidy(ws_monitor)
## End(Not run)




