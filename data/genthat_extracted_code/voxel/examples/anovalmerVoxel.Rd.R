library(voxel)


### Name: anovalmerVoxel
### Title: Computes voxelwise analysis of variance (ANOVA) tables for a
###   Linear Mixed Effects Model.
### Aliases: anovalmerVoxel

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,15), rep(1,1)), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y = runif(25), id = rep(1:5,5))
fm1 <- "~ x + y + (1|id)"
models <- anovalmerVoxel(image, mask, formula = fm1, subjData = covs, ncores = 1, REML=TRUE)




