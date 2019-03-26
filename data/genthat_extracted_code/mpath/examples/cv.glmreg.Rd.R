library(mpath)


### Name: cv.glmreg
### Title: Cross-validation for glmreg
### Aliases: cv.glmreg cv.glmreg.formula cv.glmreg.matrix cv.glmreg.default
###   plot.cv.glmreg coef.cv.glmreg
### Keywords: models regression

### ** Examples

data("bioChemists", package = "pscl")
fm_pois <- cv.glmreg(art ~ ., data = bioChemists, family = "poisson")
title("Poisson Family",line=2.5)



