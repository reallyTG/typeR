library(GSIF)


### Name: autopredict-methods
### Title: Autopredict numeric or factor type variables
### Aliases: autopredict makePixels
###   autopredict,SpatialPointsDataFrame,SpatialPixelsDataFrame-method

### ** Examples

## Not run: 
##D library(sp)
##D library(gstat)
##D library(ranger)
##D library(plotKML)
##D library(raster)
##D 
##D ## Ebergotzen data set:
##D data(eberg)
##D ## subset to 8##D 
##D eberg <- eberg[runif(nrow(eberg))<.08,]
##D coordinates(eberg) <- ~X+Y
##D proj4string(eberg) <- CRS("+init=epsg:31467")
##D data(eberg_grid)
##D gridded(eberg_grid) <- ~x+y
##D proj4string(eberg_grid) <- CRS("+init=epsg:31467")
##D 
##D ## predict sand content:
##D SNDMHT_A <- autopredict(eberg["SNDMHT_A"], eberg_grid,
##D    auto.plot=FALSE, rvgm=NULL)
##D plot(raster(SNDMHT_A$predicted["SNDMHT_A"]), col=SAGA_pal[[1]])
##D 
##D ## predict soil types:
##D soiltype <- autopredict(eberg["soiltype"], eberg_grid, 
##D   auto.plot=FALSE)
##D spplot(soiltype$predicted, col.regions=R_pal[[2]])
##D ## most probable class:
##D eberg_grid$soiltype <- as.factor(apply(soiltype$predicted@data, 1, which.max))
##D levels(eberg_grid$soiltype) = names(soiltype$predicted@data)
##D spplot(eberg_grid["soiltype"])
##D 
##D ## Meuse data set:
##D demo(meuse, echo=FALSE)
##D zinc <- autopredict(meuse["zinc"], meuse.grid[c("dist","ffreq")], 
##D   auto.plot=FALSE, rvgm=NULL)
##D spplot(zinc$predicted["zinc"])
## End(Not run)



