library(raster)


### Name: validCell
### Title: Validity of a cell, column or row number
### Aliases: validCell validCol validRow
### Keywords: spatial

### ** Examples

#using a new default raster (1 degree global)
r <- raster()
validCell(r, c(-1, 0, 1))
validRow(r, c(-1, 1, 100, 10000))



