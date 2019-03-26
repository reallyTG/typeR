library(metScanR)


### Name: getNearby
### Title: Filter environmental monitoring stations by POI
### Aliases: getNearby
### Keywords: air air, atmopsheric atmosphere, canopy, chemical, climate,
###   cloud, conductivity, data, environment, environmental flux,
###   groundwater, humidity, in-situ, lake, latitude, longitude, metadata
###   phenology, pollution, precipitation, radiation, radius, reservoir,
###   river, salinity, snow, soil, soils, stream, temperature, vapor,
###   water, weather, wind,

### ** Examples

## Not run: 
##D #returns metadata from all sites within 50 km of NEON site 'CPER'
##D   getNearby(siteID="NEON:CPER", radius=50)
##D #return metadata of sites within 10 km of Lat=41.7821 & Lon = -71.4204 (Cranston, RI, USA)
##D   getNearby(lat=41.7821, lon = -71.4204, radius=10)
## End(Not run)



