library(voxel)


### Name: lmNIfTI
### Title: Wrapper to run a model on a NIfTI image and output parametric
###   maps
### Aliases: lmNIfTI

### ** Examples

image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(0:1, dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y = runif(25))
fm1 <- "~ x + y"
Maps <- lmNIfTI(image=image, mask=mask, 
              formula=fm1, subjData=covs, ncores = 1, method="fdr")



