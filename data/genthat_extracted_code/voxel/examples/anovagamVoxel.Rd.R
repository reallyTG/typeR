library(voxel)


### Name: anovagamVoxel
### Title: Computes voxelwise analysis of variance (ANOVA) tables for a
###   Generalized Additive Model.
### Aliases: anovagamVoxel

### ** Examples

image <- oro.nifti::nifti(img = array(1:200, dim =c(2,2,2,25)))
mask <- oro.nifti::nifti(img = array(0:1, dim = c(2,2,2,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y=runif(25))
fm1 <- "~ s(x) + y"
models <- anovagamVoxel(image=image, mask=mask,
              formula=fm1, subjData=covs, ncores = 1)



