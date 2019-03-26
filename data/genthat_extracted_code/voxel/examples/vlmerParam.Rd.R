library(voxel)


### Name: vlmerParam
### Title: Run a Linear Mixed Effects Model on all voxels of a NIfTI image
###   within a mask and and return parametric coefficients tables
### Aliases: vlmerParam
### Keywords: internal

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,15),1), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), id = rep(1:5,5))
fm1 <- "~ x + (1|id)"
models <- vlmerParam(image, mask, formula = fm1, subjData = covs, ncores = 1)




