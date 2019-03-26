library(lidR)


### Name: grid_metrics3d
### Title: Voxelize the space and compute metrics for each voxel
### Aliases: grid_metrics3d

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)

# Cloud of points is voxelized with a 3-meter resolution and in each voxel
# the number of points is computed.
grid_metrics3d(las, length(Z), 3)

# Cloud of points is voxelized with a 3-meter resolution and in each voxel
# the mean scan angle of points is computed.
grid_metrics3d(las, mean(Intensity), 3)

## Not run: 
##D # Define your own metric function
##D myMetrics = function(i)
##D {
##D   ret = list(
##D      npoints = length(i),
##D      imean   = mean(i)
##D    )
##D 
##D    return(ret)
##D }
##D 
##D voxels = grid_metrics3d(las, myMetrics(Intensity), 3)
##D 
##D plot(voxels, color = "imean")
##D #etc.
## End(Not run)



