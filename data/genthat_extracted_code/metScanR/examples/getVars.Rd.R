library(metScanR)


### Name: getVars
### Title: Filter environmental monitoring stations by reported elements
### Aliases: getVars
### Keywords: air air, atmopsheric atmosphere, canopy, chemical, climate,
###   cloud, conductivity, data, environment, environmental flux,
###   groundwater, humidity, in-situ, lake, metadata phenology, pollution,
###   precipitation, radiation, reservoir, river, salinity, snow, soil,
###   soils, stream, temperature, vapor, water, weather, wind,

### ** Examples

## Not run: 
##D #return a list of sites that collect humidity data
##D   getVars(vars="humidity")
##D #return a list of sites that collect soil temperature and/or wind data
##D   getVars(vars=c("soil temperature","wind"))
##D #return a list of sites that collected snow depth data during 1970-01-01 thru 1985-05-10
##D   getVars(vars = "snow depth",startVarsDate = "1970-01-01",endVarsDate = "1985-05-10")
## End(Not run)



