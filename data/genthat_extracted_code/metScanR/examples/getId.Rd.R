library(metScanR)


### Name: getId
### Title: Filter environmental monitoring stations by identifier type
### Aliases: getId
### Keywords: COOP, FAA, GHCND, GHCNMLT, ICAO, NCDCSTNID, NEON, NRCS NWSLI,
###   TRANS, WBAN, WMO, air air, atmopsheric atmosphere, canopy, chemical,
###   climate, cloud, conductivity, data, environment, environmental flux,
###   groundwater, humidity, in-situ, lake, metadata, phenology, pollution,
###   precipitation, radiation, reservoir, river, salinity, snow, soil,
###   soils, stream, temperature, vapor, water, weather, wind,

### ** Examples

## Not run: 
##D #return a list of sites that have an WBAN identifer
##D   getId(id="WBAN")
##D #return a list of sites that have either an FAA, ICAO, or NWSLI identifer
##D   getId(id=c("FAA","ICAO","NWSLI"))
## End(Not run)



