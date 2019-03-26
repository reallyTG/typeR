library(PWFSLSmoke)


### Name: monitor_performance
### Title: Calculate Monitor Prediction Performance
### Aliases: monitor_performance
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D # If daily avg data were the prediciton and Spokane were
##D # the observed, which WA State monitors had skill?
##D wa <- airnow_load(2017) %>% monitor_subset(stateCodes='WA')
##D wa_dailyAvg <- monitor_dailyStatistic(wa, mean)
##D Spokane_dailyAvg <- monitor_subset(wa_dailyAvg, monitorIDs='530630021_01')
##D threshold <- AQI$breaks_24[4] # Unhealthy
##D performanceMetrics <- monitor_performance(wa_dailyAvg,
##D                                           Spokane_dailyAvg,
##D                                           threshold, threshold)
##D monitorIDs <- rownames(performanceMetrics)
##D mask <- performanceMetrics$heidikeSkill &
##D         !is.na(performanceMetrics$heidikeSkill)
##D skillfulIDs <- monitorIDs[mask]
##D skillful <- monitor_subset(wa_dailyAvg, monitorIDs=skillfulIDs)
##D monitorLeaflet(skillful)
## End(Not run)



