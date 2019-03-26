library(voxel)


### Name: anovagammVoxel
### Title: Computes voxelwise analysis of variance (ANOVA) tables for a
###   Generalized Additive Mixed Effects Model.
### Aliases: anovagammVoxel

### ** Examples



image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(data = c(rep(0,15), rep(1,1)),
                                     dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y=runif(25), id = rep(1:5,5))
f1 <- "~ s(x) + y"
randomFormula <- "~(1|id)"
models <- anovagammVoxel(image, mask, formula = f1,
                              randomFormula = randomFormula,
                              subjData = covs, ncores = 1, REML=TRUE)



