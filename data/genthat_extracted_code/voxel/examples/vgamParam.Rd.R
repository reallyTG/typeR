library(voxel)


### Name: vgamParam
### Title: Run a Generalized Additive Model on all voxels of a NIfTI image
###   within a mask and return parametric and smooth coefficients tables
### Aliases: vgamParam
### Keywords: internal

### ** Examples

image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(0:1, dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25))
fm1 <- "~ s(x)"
models <- vgamParam(image=image, mask=mask, 
              formula=fm1, subjData=covs, ncores = 1, method="REML")



