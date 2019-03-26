library(lidR)


### Name: lastrees
### Title: Individual tree segmentation
### Aliases: lastrees

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")
col <- pastel.colors(200)

# Using Li et al. (2012)
las <- lastrees(las, li2012(R = 3, speed_up = 5))
plot(las, color = "treeID", colorPalette = col)



