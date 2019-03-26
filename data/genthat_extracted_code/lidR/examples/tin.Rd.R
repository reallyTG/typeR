library(lidR)


### Name: tin
### Title: Spatial Interpolation Algorithm
### Aliases: tin

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las = readLAS(LASfile)

# plot(las)

dtm = grid_terrain(las, algorithm = tin())

plot(dtm, col = terrain.colors(50))
plot_dtm3d(dtm)



