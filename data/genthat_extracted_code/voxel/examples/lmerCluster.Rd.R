library(voxel)


### Name: lmerCluster
### Title: Run a Linear Mixed Effects Model on the mean intensity over a
###   region of interest
### Aliases: lmerCluster

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,14),1,2), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), id = rep(1:5,5))
fm1 <- "~ x + (1|id)"
models <- lmerCluster(image, mask, formula = fm1, subjData = covs, ncores = 1, REML=TRUE)




