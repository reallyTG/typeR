library(lidR)


### Name: random
### Title: Point Cloud Decimation Algorithm
### Aliases: random

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile, select = "xyz")

# Reach a pulse density of 1 on the overall dataset
thinned1 = lasfilterdecimate(las, random(1))
plot(grid_density(las))
plot(grid_density(thinned1))



