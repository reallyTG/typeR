library(metScanR)


### Name: getNetwork
### Title: Filter environmental monitoring stations by network
### Aliases: getNetwork
### Keywords: AL ASOS, AWOS, BOR, COCORAHS, COOP, MPRC, MSNT, NEON, SCAN,
###   SNOW, SNTL, SNTLT, UPPERAIT, USCRN, USGS, USRCRN air air, atmopsheric
###   atmosphere, canopy, chemical, climate, cloud, conductivity, data,
###   environment, environmental flux, groundwater, humidity, in-situ,
###   lake, metadata, phenology, pollution, precipitation, radiation,
###   reservoir, river, salinity, snow, soil, soils, stream, temperature,
###   vapor, water, weather, wind,

### ** Examples

## Not run: 
##D #returns metadata from all SCAN sites within the database
##D   getNetwork(network="SCAN")
##D #returns metadata from ASOS, COOP, USCRN, and NEON sites within the database
##D   getNetwork(network=c("ASOS","COOP","USCRN","NEON"))
## End(Not run)



