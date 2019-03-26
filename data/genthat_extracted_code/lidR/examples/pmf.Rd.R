library(lidR)


### Name: pmf
### Title: Ground Segmentation Algorithm
### Aliases: pmf

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las <- readLAS(LASfile, select = "xyzrn")

ws <- seq(3,12, 3)
th <- seq(0.1, 1.5, length.out = length(ws))

las <- lasground(las, pmf(ws, th))
plot(las, color = "Classification")



