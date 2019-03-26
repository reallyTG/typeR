library(lidR)


### Name: grid_density
### Title: Map the pulse or point density
### Aliases: grid_density

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

d = grid_density(lidar, 5)
plot(d)
d = grid_density(lidar, 10)
plot(d)



