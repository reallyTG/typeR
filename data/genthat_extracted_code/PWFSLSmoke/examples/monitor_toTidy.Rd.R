library(PWFSLSmoke)


### Name: monitor_toTidy
### Title: Convert 'ws_monitor' data to a tidy format
### Aliases: monitor_toTidy

### ** Examples

ws_monitor <- monitor_subset(
  Northwest_Megafires,
  monitorIDs = c('530470009_01', '530470010_01')
)

ws_monTidy <- monitor_toTidy(ws_monitor)

## Not run: 
##D ws_monTidy2 <- monitor_toTidy(ws_monTidy)
## End(Not run)




