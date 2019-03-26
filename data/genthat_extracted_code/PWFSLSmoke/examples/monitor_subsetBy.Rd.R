library(PWFSLSmoke)


### Name: monitor_subsetBy
### Title: Subset ws_monitor Object with a Filter
### Aliases: monitor_subsetBy
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
boise_tz <- monitor_subsetBy(N_M, timezone == 'America/Boise')
boise_tz_very_unhealthy <- monitor_subsetBy(boise_tz, data > AQI$breaks_24[5])
boise_tz_very_unhealthy$meta$siteName



