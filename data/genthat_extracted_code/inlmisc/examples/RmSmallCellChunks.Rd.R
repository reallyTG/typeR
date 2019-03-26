library(inlmisc)


### Name: RmSmallCellChunks
### Title: Remove Small Cell Chunks
### Aliases: RmSmallCellChunks
### Keywords: utilities

### ** Examples

set.seed(10)
r <- raster::raster(ncols = 10, nrows = 10)
r[] <- round(runif(raster::ncell(r)) * 0.7)
r <- raster::clump(r)
raster::plot(r)

r_new <- RmSmallCellChunks(r)
raster::plot(r_new, zlim = range(r[], na.rm = TRUE))




