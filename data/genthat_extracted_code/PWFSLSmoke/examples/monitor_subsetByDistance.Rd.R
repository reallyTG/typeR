library(PWFSLSmoke)


### Name: monitor_subsetByDistance
### Title: Subset ws_monitor Object by Distance from Target Location
### Aliases: monitor_subsetByDistance
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D # Napa Fires -- October, 2017
##D ca <- airnow_load(2017) %>%
##D   monitor_subset(tlim=c(20171001,20171101), stateCodes='CA')
##D Vallejo <- monitor_subset(ca, monitorIDs='060950004_01')
##D Napa_Fires <- monitor_subsetByDistance(ca,
##D                                        longitude = Vallejo$meta$longitude,
##D                                        latitude = Vallejo$meta$latitude,
##D                                        radius = 50)
##D monitorLeaflet(Napa_Fires)
## End(Not run) 



