library(lidR)


### Name: csf
### Title: Ground Segmentation Algorithm
### Aliases: csf

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las <- readLAS(LASfile, select = "xyzrn")

las <- lasground(las, csf())
plot(las, color = "Classification")



