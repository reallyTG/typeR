library(lidR)


### Name: kriging
### Title: Spatial Interpolation Algorithm
### Aliases: kriging

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las = readLAS(LASfile)

# plot(las)

dtm = grid_terrain(las, algorithm = kriging())

plot(dtm, col = terrain.colors(50))
plot_dtm3d(dtm)



