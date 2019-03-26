library(PWFSLSmoke)


### Name: monitor_join
### Title: Merge Data for Monitors with Shared monitorIDs
### Aliases: monitor_join
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D Jul <- monitor_subset(Northwest_Megafires,
##D                       tlim=c(2015070100,2015073123),
##D                       timezone='America/Los_Angeles')
##D Aug <- monitor_subset(Northwest_Megafires,
##D                       tlim=c(2015080100,2015083123),
##D                       timezone='America/Los_Angeles')
##D Methow_Valley <- monitor_join(Jul, Aug, monitorIDs=c('530470010_01','530470009_01'))
## End(Not run)



