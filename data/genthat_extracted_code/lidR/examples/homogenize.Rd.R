library(lidR)


### Name: homogenize
### Title: Point Cloud Decimation Algorithm
### Aliases: homogenize

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile, select = "xyz")

# Select points randomly to reach an homogeneous density of 1
thinned = lasfilterdecimate(las, homogenize(1,5))
plot(grid_density(thinned))



