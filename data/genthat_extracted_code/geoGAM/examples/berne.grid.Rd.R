library(geoGAM)


### Name: berne.grid
### Title: Berne - very small extract of prediction grid
### Aliases: berne.grid
### Keywords: datasets

### ** Examples


## Not run: 
##D data(berne.grid)
##D 
##D # plot spatial object
##D library(raster)
##D 
##D coordinates(berne.grid) <- ~x+y
##D proj4string(berne.grid) <- CRS("+init=epsg:21781")
##D gridded(berne.grid) <- TRUE
##D 
##D plot( raster(berne.grid, layer = "tr_se_mrrtf2m"))
## End(Not run)



