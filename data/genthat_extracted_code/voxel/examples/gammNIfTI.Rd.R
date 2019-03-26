library(voxel)


### Name: gammNIfTI
### Title: Wrapper to run a Generalized Additive Mixed Effects model on an
###   Nifti and output a parametric map
### Aliases: gammNIfTI

### ** Examples


image <- oro.nifti::nifti(img = array(rnorm(1600, sd=10), dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(c(rep(0,14), rep(1,2)), dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y = runif(25), id = rep(1:5,5))
fm1 <- "~ s(x) + s(y)"
randomFormula <- "~(1|id)"
Maps <- gammNIfTI(image, mask, formula = fm1, 
                 randomFormula = randomFormula, subjData = covs, ncores = 1,
                 method="fdr", REML=TRUE)





