library(macleish)


### Name: mass_gis
### Title: Retrieve elevation layers from MassGIS
### Aliases: mass_gis macleish_intersect

### ** Examples


## Not run: 
##D # have to download the shapefiles...cound take a while...
##D elevation <- mass_gis()
##D macleish_elevation <- macleish_intersect(elevation)
##D if (require(sp)) {
##D   plot(macleish_elevation)
##D }
##D 
##D dcr_trails <- mass_gis("dcrtrails")
##D 
## End(Not run)



