library(oce)


### Name: geodXy
### Title: Convert From Geographical to Geodesic Coordinates
### Aliases: geodXy

### ** Examples

## Not run: 
##D # Develop a transect-based axis system for final data(section) stations
##D library(oce)
##D data(section)
##D lon <- tail(section[["longitude", "byStation"]], 26)
##D lat <- tail(section[["latitude", "byStation"]], 26)
##D lonR <- tail(lon, 1)
##D latR <- tail(lat, 1)
##D data(coastlineWorld)
##D mapPlot(coastlineWorld, proj="+proj=merc",
##D         longitudelim=c(-75,-65), latitudelim=c(35,43), col="gray")
##D mapPoints(lon, lat)
##D XY <- geodXy(lon,lat,mean(lon), mean(lat))
##D angle <- 180/pi*atan(coef(lm(y~x, data=XY))[2])
##D mapCoordinateSystem(lonR, latR, 500, angle, col=2)
##D # Compare UTM calculation
##D UTM <- lonlat2utm(lon, lat, zone=18) # we need to set the zone for this task!
##D angleUTM <- 180/pi*atan(coef(lm(northing~easting, data=UTM))[2])
##D mapCoordinateSystem(lonR, latR, 500, angleUTM, col=3)
##D legend("topright", lwd=1, col=2:3, bg="white", title="Axis Rotation Angle",
##D        legend=c(sprintf("geod: %.1f deg", angle), sprintf("utm: %.1f deg",angleUTM)))
## End(Not run)



