library(lidR)


### Name: dalponte2016
### Title: Individual Tree Segmentation Algorithm
### Aliases: dalponte2016

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")
col <- pastel.colors(200)

chm <- grid_canopy(las, 0.5, p2r(0.3))
ker <- matrix(1,3,3)
chm <- raster::focal(chm, w = ker, fun = mean, na.rm = TRUE)

ttops <- tree_detection(chm, lmf(4, 2))
las   <- lastrees(las, dalponte2016(chm, ttops))
plot(las, color = "treeID", colorPalette = col)



