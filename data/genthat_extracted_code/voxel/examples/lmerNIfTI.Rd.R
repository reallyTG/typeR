library(voxel)


### Name: lmerNIfTI
### Title: Run a Linear Mixed Effects Model on a NIfTI image and output a
###   parametric maps
### Aliases: lmerNIfTI

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,14),1,1), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), id = rep(1:5,5))
fm1 <- "~ x + (1|id)"
Maps <- lmerNIfTI(image, mask, formula = fm1, subjData = covs, method="fdr", ncores = 1)




