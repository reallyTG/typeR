library(oce)


### Name: magneticField
### Title: Earth magnetic declination, inclination, and intensity
### Aliases: magneticField

### ** Examples

library(oce)
# Halifax NS
magneticField(-(63+36/60), 44+39/60, 2013)

## Not run: 
##D ## map of North American values
##D data(coastlineWorld)
##D mapPlot(coastlineWorld, longitudelim=c(-130,-55), latitudelim=c(35,60),
##D         projection="+proj=lcc +lat_0=20 +lat_1=60 +lon_0=-100")
##D lon <- seq(-180, 180, 1)
##D lat <- seq(-90, 90)
##D lonm <- rep(lon, each=length(lat))
##D latm <- rep(lat, times=length(lon))
##D ## Note the counter-intuitive nrow argument
##D decl <- matrix(magneticField(lonm, latm, 2013)$declination,
##D                nrow=length(lon), byrow=TRUE)
##D mapContour(lon, lat, decl, col='red', levels=seq(-90, 90, 5))
##D incl <- matrix(magneticField(lonm, latm, 2013)$inclination,
##D                nrow=length(lon), byrow=TRUE)
##D mapContour(lon, lat, incl, col='blue', levels=seq(-90, 90, 5))
## End(Not run)




