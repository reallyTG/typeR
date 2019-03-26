library(rasterList)


### Name: crop,RasterList-method
### Title: 'Crop' methods for a 'RasterList-class' object.
### Aliases: crop crop,RasterList-method

### ** Examples



precf <- system.file("map/precipitation.grd", package="rasterList")
prec <- stack(precf)
## Not run: 
##D ## Sample L-moments 
##D 
##D library(lmom)
##D 
##D samlmom <- stack(rasterList(prec,FUN=samlmu))
##D ## Fitting a Random Probability Distribution: it is a 'rasterList' Object
##D fitdist <- rasterList(samlmom,FUN=pelgam)
##D 
##D ##### ZOOM IN 
##D ## set a mask 
##D mask <-raster( extent(fitdist)/4 )
##D 
##D 
##D fitdist_masked <- crop ( x = fitdist,y=mask)
## End(Not run)







