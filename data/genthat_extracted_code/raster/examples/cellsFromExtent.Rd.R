library(raster)


### Name: cellsFromExtent
### Title: Cells from extent, and vice versa
### Aliases: cellsFromExtent extentFromCells
### Keywords: spatial

### ** Examples

r <- raster()
bb <- extent(-5, 5, -5, 5)
cells <- cellsFromExtent(r, bb)
r <- crop(r, bb)
r[] <- cells

e <- extentFromCells(r, 50:55)



