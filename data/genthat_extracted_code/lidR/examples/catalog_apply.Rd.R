library(lidR)


### Name: catalog_apply
### Title: LAScatalog processing engine
### Aliases: catalog_apply

### ** Examples

# More examples might be avaible in the official lidR vignettes or
# on the github wiki <http://jean-romain.github.io/lidR/wiki>

## =========================================================================
## Example 1: detect all the tree tops over an entire catalog
## (this is basically the reproduction of existing lidR function 'tree_detection')
## =========================================================================

# 1. Build the user-defined function that analyzes each chunk of the catalog.
# The function's first argument is a LAScluster object. The other arguments can be freely
# choosen by the user.
my_tree_detection_method <- function(cluster, ws)
{
  # The cluster argument is a LAScluster object. The user does not need to know how it works.
  # readLAS will load the region of interest (chunk) with a buffer around it, taking advantage of
  # point cloud indexation if possible. The filter and select options are propagated automatically
  las <- readLAS(cluster)
  if (is.empty(las)) return(NULL)

  # Find the tree tops using a user-developed method (here simply a LMF).
  ttops <- tree_detection(las, lmf(ws))

  # ttops is a SpatialPointsDataFrame that contains the tree tops in our region of interest
  # plus the trees tops in the buffered area. We need to remove the buffer otherwise we will get
  # some trees more than once.
  bbox  <- raster::extent(cluster)
  ttops <- raster::crop(ttops, bbox)

  return(ttops)
}

# 2. Build a project (here, a single file catalog for the purposes of this dummmy example).
LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
project <- catalog(LASfile)
plot(project)

# 3. Set some catalog options.
# For this dummy example, the chunk size is 80 m and the buffer is 10 m using a single core.
opt_chunk_buffer(project) <- 10
opt_cores(project)        <- 1L
opt_chunk_size(project)   <- 80            # small because this is a dummy example.
opt_select(project)       <- "xyz"         # read only the coordinates.
opt_filter(project)       <- "-keep_first" # read only first returns.

# 4. Apply a user-defined function to take advantage of the internal engine
opt    <- list(need_buffer = TRUE)   # catalog_apply will throw an error if buffer = 0
output <- catalog_apply(project, my_tree_detection_method, ws = 5, .options = opt)

# 5. Post-process the output to merge the results (depending on the output computed).
# Here, each value of the list is a SpatialPointsDataFrame, so rbind does the job:
output <- do.call(rbind, output)
spplot(output)

## ===================================================
## Example 2: compute a rumple index on surface points
## ===================================================

rumple_index_surface = function(cluster, res)
{
  las = readLAS(cluster)
  if (is.empty(las)) return(NULL)

  las    <- lasfiltersurfacepoints(las, 1)
  rumple <- grid_metrics(las, rumple_index(X,Y,Z), res)
  bbox   <- raster::extent(cluster)
  rumple <- raster::crop(rumple, bbox)

  return(rumple)
}

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
project <- catalog(LASfile)

opt_chunk_buffer(project) <- 1
opt_cores(project)        <- 1L
opt_chunk_size(project)   <- 120     # small because this is a dummy example.
opt_select(project)       <- "xyz"   # read only the coordinates.

opt     <- list(raster_alignment = 20)  # catalog_apply will adjust the chunks if required
output  <-  catalog_apply(project, rumple_index_surface, res = 20, .options = opt)
output  <- do.call(raster::merge, output)
plot(output, col = height.colors(50))



