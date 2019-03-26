library(lidR)


### Name: watershed
### Title: Individual Tree Segmentation Algorithm
### Aliases: watershed mcwatershed

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")
col <- pastel.colors(250)

chm <- grid_canopy(las, res = 0.5, p2r(0.3))
ker <- matrix(1,3,3)
chm <- raster::focal(chm, w = ker, fun = mean, na.rm = TRUE)

ttops <- tree_detection(chm, lmf(4, 2))
las   <- lastrees(las, mcwatershed(chm, ttops))

x = plot(las, color = "treeID", colorPalette = col)
add_treetops3d(x, ttops)



