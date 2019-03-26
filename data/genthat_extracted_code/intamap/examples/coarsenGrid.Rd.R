library(intamap)


### Name: coarsenGrid
### Title: Coarsening of a spatial grid
### Aliases: coarsenGrid
### Keywords: spatial

### ** Examples

data(meuse.grid)
gridded(meuse.grid) = ~x+y
newMeuseGrid = coarsenGrid(meuse.grid,coarse=2,offset=c(1,1))




