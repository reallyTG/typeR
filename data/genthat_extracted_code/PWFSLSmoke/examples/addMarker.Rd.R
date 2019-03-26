library(PWFSLSmoke)


### Name: addMarker
### Title: Add Icons to a Map or RgoogleMap Plot
### Aliases: addMarker
### Keywords: plotting

### ** Examples

## Not run: 
##D ca <- loadLatest() %>% monitor_subset(stateCodes='CA')
##D # Google map
##D map <- monitorEsriMap(ca)
##D addMarker(ca$meta$longitude, ca$meta$latitude, map=map)
##D # line map
##D monitorMap(ca)
##D addMarker(ca$meta$longitude, ca$meta$latitude, color = "blue", expansion = 1)
## End(Not run)



