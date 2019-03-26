library(voxel)


### Name: vlmParam
### Title: Run a Linear Model on all voxels of a NIfTI image within a mask
###   and and return parametric coefficients tables
### Aliases: vlmParam
### Keywords: internal

### ** Examples

image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(0:1, dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y = runif(25))
fm1 <- "~ x + y"
models <- vlmParam(image=image, mask=mask, formula=fm1, subjData=covs, ncores = 1)



