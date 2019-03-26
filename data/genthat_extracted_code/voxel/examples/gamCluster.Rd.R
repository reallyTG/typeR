library(voxel)


### Name: gamCluster
### Title: Run a Generalized Additive Model on the mean intensity over a
###   region of interest
### Aliases: gamCluster

### ** Examples

image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(1:4, dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25))
fm1 <- "~ s(x)"
models <- gamCluster(image=image, mask=mask, 
              formula=fm1, subjData=covs, ncores = 1, method="REML")



