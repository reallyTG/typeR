library(lidR)


### Name: lmf
### Title: Individual Tree Detection Algorithm
### Aliases: lmf

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las = readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")

# point-cloud-based
# =================

# 5x5 m fixed windows size
ttops = tree_detection(las, lmf(5))

x = plot(las)
add_treetops3d(x, ttops)

# variable windows size
f = function(x) { x * 0.07 + 3}
ttops = tree_detection(las, lmf(f))

x = plot(las)
add_treetops3d(x, ttops)

# raster-based
# ============

# 5x5 m fixed windows size
chm = grid_canopy(las, res = 1, p2r(0.15))
kernel = matrix(1,3,3)
chm = raster::focal(chm, w = kernel, fun = median, na.rm = TRUE)

ttops = tree_detection(chm, lmf(5))

raster::plot(chm, col = height.colors(30))
sp::plot(ttops, add = TRUE)

# variable windows size
f = function(x) { x * 0.07 + 3 }
ttops = tree_detection(chm, lmf(f))

raster::plot(chm, col = height.colors(30))
sp::plot(ttops, add = TRUE)



