library(voxel)


### Name: lmerVoxel
### Title: Run a Linear Mixed Effects Model on all voxels of a NIfTI image
###   within a mask.
### Aliases: lmerVoxel
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
##D mask <- oro.nifti::nifti(img = array(0:1, dim = c(4,4,4,1)))
##D set.seed(1)
##D covs <- data.frame(x = runif(25), id = rep(1:5,5))
##D fm1 <- "~ x + (1|id)"
##D models <- lmerVoxel(image, mask, formula = fm1, subjData = covs, ncores = 1, REML=T)
## End(Not run)



