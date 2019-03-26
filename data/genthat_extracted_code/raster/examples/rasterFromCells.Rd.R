library(raster)


### Name: rasterFromCells
### Title: Subset a raster by cell numbers
### Aliases: rasterFromCells
### Keywords: spatial

### ** Examples

r <- raster(ncols=100, nrows=100)
cells <- c(3:5, 210)
r <- rasterFromCells(r, cells)
cbind(1:ncell(r), getValues(r))



