library(hydroTSM)


### Name: hypsometric
### Title: Hypsometric Curve
### Aliases: hypsometric
### Keywords: graphs manip

### ** Examples

## Not run: 
##D # Loading the DEM
##D require(rgdal)
##D data(EbroDEM1000m)
##D dem <- EbroDEM1000m
##D 
##D # Plotting the DEM
##D require(sp)
##D spplot(dem, scales=list(draw=TRUE, y=list(rot=90)))
##D 
##D # Computing and plotting the hypsometric curve
##D hypsometric(dem)
##D 
##D # If the raster file has more than 1 band, and the elevation data are in a 
##D # band different from 1:
##D dem$ELEVATION <- EbroDEM1000m$band1 # dummy example
##D hypsometric(dem, band= 2)
##D hypsometric(dem, band= "ELEVATION") # same as before, but user-friendly
## End(Not run)



