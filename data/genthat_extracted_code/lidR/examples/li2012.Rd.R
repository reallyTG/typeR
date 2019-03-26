library(lidR)


### Name: li2012
### Title: Individual Tree Segmentation Algorithm
### Aliases: li2012

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")
col <- pastel.colors(200)

las <- lastrees(las, li2012(dt1 = 1.4))
plot(las, color = "treeID", colorPalette = col)



