library(PWFSLSmoke)


### Name: monitor_asDataframe
### Title: Return Monitor Data in a Single Dataframe
### Aliases: monitor_asDataframe
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D wa <- monitor_subset(Northwest_Megafires, stateCodes='WA')
##D Omak_df <- monitor_asDataframe(wa, monitorID='530470013_01',
##D                                extraColumns=c('nowcast','dailyAvg'),
##D                                metaColumns=c('aqsID','siteName','timezone'),
##D                                tlim=c(20150801,20150901))
## End(Not run)



