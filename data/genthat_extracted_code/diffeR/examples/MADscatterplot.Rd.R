library(diffeR)


### Name: MADscatterplot
### Title: MAD scatterplot
### Aliases: MADscatterplot
### Keywords: spatial

### ** Examples

old.par <- par(no.readonly = TRUE)
grid1 <- raster(system.file("external/GRID1_INT.rst", package="diffeR"))
grid2 <- raster(system.file("external/GRID2_INT.rst", package="diffeR"))
strata <- raster(system.file("external/strata_int.rst", package="diffeR"))
MADscatterplot(grid1, grid2, strata)

veg_obs1 <- raster(system.file("external/veg_obs1.rst", package="diffeR")) 
veg_pre1 <- raster(system.file("external/veg_pre1.rst", package="diffeR"))
veg_mask1 <- raster(system.file("external/veg_mask1.rst", package="diffeR")) 
MADscatterplot(veg_obs1, veg_pre1, veg_mask1) 
par(old.par)



