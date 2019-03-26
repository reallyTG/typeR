library(PWFSLSmoke)


### Name: monitor_writeCurrentGeoJSON
### Title: Write Current Monitor Data to GeoJSON
### Aliases: monitor_writeCurrentGeoJSON
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D wa <- loadLatest() %>% monitor_subset(stateCodes = 'WA')
##D wa_current_geojson <- monitor_writeCurrentGeoJSON(wa, 'wa_monitors.geojson')
##D wa_current_list <- jsonlite::fromJSON(wa_current)
##D wa_spdf <- rgdal::readOGR(dsn='wa_monitors.geojson', layer="OGRGeoJSON")
##D plot(wa_spdf)
##D map('state', 'washington', add = TRUE)
## End(Not run)



