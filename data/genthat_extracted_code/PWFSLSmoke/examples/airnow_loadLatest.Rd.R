library(PWFSLSmoke)


### Name: airnow_loadLatest
### Title: Load Most Recent Processed AirNow Monitoring Data
### Aliases: airnow_loadLatest
### Keywords: AirNow

### ** Examples

## Not run: 
##D airnow <- airnow_loadLatest()
##D ca_mean <- monitor_subset(airnow, stateCodes='CA') %>%
##D            monitor_collapse()
##D monitorPlot_timeseries(ca_mean, shadedNight=TRUE)
## End(Not run)



