library(PWFSLSmoke)


### Name: monitorLeaflet
### Title: Leaflet Interactive Map of Monitoring Stations
### Aliases: monitorLeaflet
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D # Napa Fires -- October, 2017
##D ca <- airnow_load(2017) %>%
##D   monitor_subset(tlim=c(20171001,20171101), stateCodes='CA')
##D v_low <- AQI$breaks_24[5] 
##D CA_very_unhealthy_monitors <- monitor_subset(ca, vlim=c(v_low, Inf))
##D monitorLeaflet(CA_very_unhealthy_monitors,
##D                legendTitle = "October, 2017",
##D                maptype = "toner")
## End(Not run)



