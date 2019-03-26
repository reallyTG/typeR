library(metScanR)


### Name: siteFinder
### Title: Filter environmental monitoring stations (wrapper)
### Aliases: siteFinder
### Keywords: atmopsheric atmosphere, climate, data, environment,
###   environmental in-situ, meteorological meteorology, weather,

### ** Examples

## Not run: 
##D #Return metadata of sites within 50 km of NEON's HARV active from 1965-10-20 to 1986-09-02
##D   siteFinder(siteID="NEON:HARV",startDate="1965-10-20",
##D   endDate="1986-09-02",radius=50)
##D 
##D #Return metadata of SCAN, SNTL, and ASOS sites active from at least 2000-01-05 onward
##D   siteFinder(network=c("SCAN","SNTL","ASOS"),startDate="2000-01-05")
##D 
##D #Return metadata of sites in Brazil with elevations of 1500 +/- 250 (m) Above Sea Level
##D   siteFinder(minElev=1000,maxElev=1800,country="Brazil")
## End(Not run)



