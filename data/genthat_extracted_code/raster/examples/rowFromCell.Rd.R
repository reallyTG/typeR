library(raster)


### Name: rowFromCell
### Title: Row or column number from a cell number
### Aliases: rowFromCell rowFromCell,BasicRaster,numeric-method colFromCell
###   colFromCell,BasicRaster,numeric-method rowColFromCell
###   rowColFromCell,BasicRaster,numeric-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=10, nrows=10)
colFromCell(r, c(5,15))
rowFromCell(r, c(5,15))
rowColFromCell(r, c(5,15))



