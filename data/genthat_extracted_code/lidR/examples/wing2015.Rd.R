library(lidR)


### Name: wing2015
### Title: Snags Segmentation Algorithm
### Aliases: wing2015

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile, select = "xyzi", filter="-keep_first") # Wing also included -keep_single

# For the Wing2015 method, supply a matrix of snag BranchBolePtRatio conditional
# assessment thresholds (see Wing et al. 2015, Table 2, pg. 172)
bbpr_thresholds <- matrix(c(0.80, 0.80, 0.70,
                          0.85, 0.85, 0.60,
                          0.80, 0.80, 0.60,
                          0.90, 0.90, 0.55),
                          nrow =3, ncol = 4)

# Run snag classification and assign classes to each point
las <- lassnags(las, wing2015(neigh_radii = c(1.5, 1, 2), BBPRthrsh_mat = bbpr_thresholds))

# Plot it all, tree and snag points...
plot(las, color="snagCls", colorPalette = rainbow(5))

# Filter and plot snag points only
snags <- lasfilter(las, snagCls > 0)
plot(snags, color="snagCls", colorPalette = rainbow(5)[-1])

# Wing et al's (2015) methods ended with performing tree segmentation on the
# classified and filtered point cloud using the watershed method




