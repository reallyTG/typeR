library(PWFSLSmoke)


### Name: addIcon
### Title: Add Icons to a Map or RgoogleMap Plot
### Aliases: addIcon

### ** Examples

## Not run: 
##D ca <- loadLatest() %>% monitor_subset(stateCodes='CA')
##D # Google map
##D map <- monitorEsriMap(ca)
##D addIcon("orangeFlame", ca$meta$longitude, ca$meta$latitude, map=map, expansion=0.1)
##D # line map
##D monitorMap(ca)
##D addIcon("orangeFlame", ca$meta$longitude, ca$meta$latitude, expansion=0.002)
## End(Not run)



