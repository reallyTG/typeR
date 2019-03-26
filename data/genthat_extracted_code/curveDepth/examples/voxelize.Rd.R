library(curveDepth)


### Name: voxelize
### Title: Voxelization of functions
### Aliases: voxelize

### ** Examples

library(curveDepth)
# Create some data based on growth curves
g1d <- dataf.growth()
g3d <- list("")
set.seed(1)
for (i in 1:length(g1d$dataf)){
  g3d[[i]] <- list(
    args = g1d$dataf[[1]]$args,
    vals = cbind(g1d$dataf[[i]]$vals,
                 g1d$dataf[[i]]$vals[length(g1d$dataf[[i]]$vals):1],
                 rnorm(length(g1d$dataf[[i]]$vals), sd = 1) +
                   rnorm(1, mean = 0, sd = 10)))
}
# Define voxels' bounds and resolution
from <- c(65, 65, -25)
to <- c(196, 196, 25)
steps <- 100
by <- (to - from) / steps
# Voxelize all curves
fs <- list("")
for (i in 1:length(g3d)){
  fs[[i]] <- voxelize(g3d[[i]], from, to, by)
}
## Not run: 
##D # Plot first 10 curves
##D library(rgl)
##D rgl.open()
##D rgl.bg(color = "white")
##D for (i in 1:10){
##D   spheres3d(fs[[i]]$voxels[, 1], fs[[i]]$voxels[, 2], fs[[i]]$voxels[, 3],
##D             col = "red", radius = 0.5)
##D }
## End(Not run)



