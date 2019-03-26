library(lidR)


### Name: lassnags
### Title: Snag classification
### Aliases: lassnags

### ** Examples

## Not run: 
##D LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
##D las <- readLAS(LASfile, select = "xyzi", filter="-keep_first") # Wing also included -keep_single
##D 
##D # For the Wing2015 method, supply a matrix of snag BranchBolePtRatio conditional
##D # assessment thresholds (see Wing et al. 2015, Table 2, pg. 172)
##D bbpr_thresholds <- matrix(c(0.80, 0.80, 0.70,
##D                           0.85, 0.85, 0.60,
##D                           0.80, 0.80, 0.60,
##D                           0.90, 0.90, 0.55),
##D                           nrow =3, ncol = 4)
##D 
##D # Run snag classification and assign classes to each point
##D las <- lassnags(las, wing2015(neigh_radii = c(1.5, 1, 2), BBPRthrsh_mat = bbpr_thresholds))
##D 
##D # Plot it all, tree and snag points...
##D plot(las, color="snagCls", colorPalette = rainbow(5))
##D 
##D # Filter and plot snag points only
##D snags <- lasfilter(las, snagCls > 0)
##D plot(snags, color="snagCls", colorPalette = rainbow(5)[-1])
##D 
##D # Wing et al's (2015) methods ended with performing tree segmentation on the
##D # classified and filtered point cloud using the watershed method
## End(Not run)



