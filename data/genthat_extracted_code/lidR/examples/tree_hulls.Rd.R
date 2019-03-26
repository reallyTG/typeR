library(lidR)


### Name: tree_hulls
### Title: Compute the hull of each tree.
### Aliases: tree_hulls

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las = readLAS(LASfile, select = "xyz0", filter = "-drop_z_below 0")

convex_hulls = tree_hulls(las)
sp::plot(convex_hulls)

bbox_hulls = tree_hulls(las, "bbox")
sp::plot(bbox_hulls)

## Not run: 
##D concave_hulls = tree_hulls(las, "concave")
##D sp::plot(concave_hulls)
## End(Not run)



