library(lidR)


### Name: grid_terrain
### Title: Digital Terrain Model
### Aliases: grid_terrain

### ** Examples


LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las = readLAS(LASfile)
plot(las)

dtm1 = grid_terrain(las, algorithm = knnidw(k = 6L, p = 2))
dtm2 = grid_terrain(las, algorithm = tin())
dtm3 = grid_terrain(las, algorithm = kriging(k = 10L))

## Not run: 
##D plot(dtm1)
##D plot(dtm2)
##D plot(dtm3)
##D plot_dtm3d(dtm1)
##D plot_dtm3d(dtm2)
##D plot_dtm3d(dtm3)
## End(Not run)



