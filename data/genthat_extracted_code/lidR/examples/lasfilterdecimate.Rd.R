library(lidR)


### Name: lasfilterdecimate
### Title: Decimate a LAS object
### Aliases: lasfilterdecimate

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile, select = "xyz")

# Select points randomly to reach an overall density of 1
thinned1 = lasfilterdecimate(las, random(1))
plot(grid_density(las))
plot(grid_density(thinned1))

# Select points randomly to reach an homogeneous density of 1
thinned2 = lasfilterdecimate(las, homogenize(1,5))
plot(grid_density(thinned2))

# Select the highest point within each pixel of an overlayed grid
thinned3 = lasfilterdecimate(las, highest(5))
plot(thinned3)



