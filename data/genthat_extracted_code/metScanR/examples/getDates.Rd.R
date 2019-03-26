library(metScanR)


### Name: getDates
### Title: Filter environmental monitoring stations by active date(s)
### Aliases: getDates
### Keywords: Earth, air air, atmopsheric atmosphere, canopy, chemical,
###   climate, cloud, conductivity, country, data, dates, environment,
###   environmental flux, groundwater, in-situ, lake, metadata phenology,
###   pollution, precipitation, radiation, reservoir, river, salinity,
###   snow, soil, soils, stream, temperature, times, vapor, water, weather,
###   wind, world,

### ** Examples

## Not run: 
##D #return metadata of sites that were active from at least 1940-01-01 through 1970-04-18
##D   getDates(startDate="1940-01-01",endDate = "1970-04-18")
##D #return metadata of sites that were active up through at least 1950-07-08
##D   getDates(endDate = "1950-07-08")
##D #return metadata of sites that were active up through at least 1950-07-08
##D #and have an unknown start date:
##D   getDates(endDate = "1950-07-08", includeUnk=TRUE)
## End(Not run)



