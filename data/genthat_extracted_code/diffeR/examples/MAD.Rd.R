library(diffeR)


### Name: MAD
### Title: Mean Absolute Deviation (MAD)
### Aliases: MAD
### Keywords: spatial

### ** Examples

old.par <- par(no.readonly = TRUE)
grid1 <- raster(system.file("external/GRID1_INT.rst", package="diffeR"))
grid2 <- raster(system.file("external/GRID2_INT.rst", package="diffeR"))
strata <- raster(system.file("external/strata_int.rst", package="diffeR"))
MAD(grid1, grid2, strata, eval="original")
MAD(grid1, grid2, strata, eval="multiple")

## Not run: 
##D veg_obs1 <- raster(system.file("external/veg_obs1.rst", package="diffeR")) 
##D veg_pre1 <- raster(system.file("external/veg_pre1.rst", package="diffeR")) 
##D veg_mask1 <- raster(system.file("external/veg_mask1.rst", package="diffeR")) 
##D MADscatterplot(veg_obs1, veg_pre1, veg_mask1) 
##D MAD(veg_obs1, veg_pre1, veg_mask1, eval="multiple") 
## End(Not run)
par(old.par)



