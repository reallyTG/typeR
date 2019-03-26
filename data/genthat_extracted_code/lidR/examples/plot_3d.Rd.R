library(lidR)


### Name: plot_3d
### Title: Add a spatial object to a point cloud scene
### Aliases: plot_3d plot_dtm3d add_dtm3d add_treetops3d

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las = readLAS(LASfile)

dtm = grid_terrain(las, algorithm = tin())
ttops <- tree_detection(las, lmf(ws = 5))

plot_dtm3d(dtm)

x = plot(las)
add_dtm3d(x, dtm)
add_treetops3d(x, ttops)

## Not run: 
##D library(magrittr)
##D plot(las) %>% add_dtm3d(dtm) %>% add_treetops3d(ttops)
## End(Not run)



