library(lidR)


### Name: knnidw
### Title: Spatial Interpolation Algorithm
### Aliases: knnidw

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las = readLAS(LASfile)

# plot(las)

dtm = grid_terrain(las, algorithm = knnidw(k = 6L, p = 2))

plot(dtm, col = terrain.colors(50))
plot_dtm3d(dtm)



