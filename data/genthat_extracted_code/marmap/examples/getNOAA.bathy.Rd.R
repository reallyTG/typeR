library(marmap)


### Name: getNOAA.bathy
### Title: Import bathymetric data from the NOAA server
### Aliases: getNOAA.bathy

### ** Examples

## Not run: 
##D # you must have an internet connection. This line queries the NOAA ETOPO1 database 
##D # for data from North Atlantic, for a resolution of 10 minutes. 
##D 
##D getNOAA.bathy(lon1=-20,lon2=-90,lat1=50,lat2=20, resolution=10) -> a
##D plot(a, image=TRUE, deep=-6000, shallow=0, step=1000)
##D 
##D # download speed for a matrix of 10 degrees x 10 degrees x 30 minutes
##D system.time(getNOAA.bathy(lon1=0,lon2=10,lat1=0,lat2=10, resolution=30))
## End(Not run)



