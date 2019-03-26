library(inlmisc)


### Name: BumpDisconnectCells
### Title: Adjust Vertically Disconnected Cells
### Aliases: BumpDisconnectCells
### Keywords: utilities

### ** Examples

set.seed(0)
r_top <- raster::raster(ncols = 10, nrows = 10)
r_bot <- raster::raster(ncols = 10, nrows = 10)
r_top[] <- rnorm(raster::ncell(r_top), mean = 12)
r_bot[] <- rnorm(raster::ncell(r_bot), mean = 10)
rs <- raster::stack(r_top, r_bot)
r <- BumpDisconnectCells(rs, min.overlap = 0.1)
raster::plot(r, col = GetColors(255, reverse = TRUE))
summary(r[])

r_bot_new <- r_bot + r




