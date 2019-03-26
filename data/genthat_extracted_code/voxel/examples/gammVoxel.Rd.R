library(voxel)


### Name: gammVoxel
### Title: Run a Generalized Additive Mixed Effects Model on all voxels of
###   a NIfTI image within a mask.
### Aliases: gammVoxel
### Keywords: internal

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,14),1), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), id = rep(1:5,5))
fm1 <- "~ s(x)"
randomFormula <- "~(1|id)"
models <- gammVoxel(image = image , mask = mask, formula = fm1, randomFormula = randomFormula, 
                                                       subjData = covs, ncores = 1, REML=TRUE)




