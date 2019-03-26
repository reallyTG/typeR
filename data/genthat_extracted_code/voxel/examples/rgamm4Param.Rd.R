library(voxel)


### Name: rgamm4Param
### Title: Run a Generalized Additive Mixed Effects Model on all voxels of
###   a NIfTI image return coefficients and residuals
### Aliases: rgamm4Param
### Keywords: internal

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,15), 1), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y = runif(25), id = rep(1:5,5))
fm1 <- "~ s(x) + s(y)"
randomFormula <- "~(1|id)"
models <- rgamm4Param(image, mask, formula = fm1, 
                 randomFormula = randomFormula, subjData = covs, ncores = 1, REML=TRUE)




