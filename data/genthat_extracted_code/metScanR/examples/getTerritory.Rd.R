library(metScanR)


### Name: getTerritory
### Title: Filter environmental monitoring stations by state/territory
### Aliases: getTerritory
### Keywords: AL ASOS, AWOS, BOR, COCORAHS, COOP, MPRC, MSNT, NEON, SCAN,
###   SNOW, SNTL, SNTLT, UPPERAIT, USCRN, USGS, USRCRN air air, atmopsheric
###   atmosphere, canopy, chemical, climate, cloud, conductivity, data,
###   environment, environmental flux, groundwater, humidity, in-situ,
###   lake, metadata, phenology, pollution, precipitation, radiation,
###   reservoir, river, salinity, snow, soil, soils, stream, temperature,
###   vapor, water, weather, wind,

### ** Examples

## Not run: 
##D #returns metadata from all stations within Rhode Island (RI)
##D   getTerritory(territory"RI")
##D #returns metadata from stations within Colorado and Utah
##D   getTerritory(territory=c("CO","UT"))
## End(Not run)



