library(raster)


### Name: cellFrom
### Title: Get cell, row, or column number
### Aliases: cellFromRowCol
###   cellFromRowCol,BasicRaster,numeric,numeric-method colFromX
###   colFromX,BasicRaster,numeric-method rowFromY
###   rowFromY,BasicRaster,numeric-method cellFromXY
###   cellFromXY,BasicRaster-method cellFromRow cellFromCol
###   cellFromRowColCombine fourCellsFromXY cellFromLine cellFromPolygon
### Keywords: spatial

### ** Examples

r <- raster(ncols=10, nrows=10)
cellFromRowCol(r, 5, 5)
cellFromRowCol(r, 1:2, 1:2)
cellFromRowColCombine(r, 1:3, 1:2)
cellFromCol(r, 1)
cellFromRow(r, 1)

colFromX(r, 0.5)
rowFromY(r, 0.5)
cellFromXY(r, cbind(c(0.5,5), c(15, 88)))
fourCellsFromXY(r, cbind(c(0.5,5), c(15, 88)))

cds1 <- rbind(c(-180,-20), c(-160,5), c(-60, 0), c(-160,-60), c(-180,-20))
cds2 <- rbind(c(80,0), c(100,60), c(120,0), c(120,-55), c(80,0))
pols <- SpatialPolygons(list(Polygons(list(Polygon(cds1)), 1), Polygons(list(Polygon(cds2)), 2)))
cellFromPolygon(r, pols)



