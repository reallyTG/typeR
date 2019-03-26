library(mpath)


### Name: glmregNB
### Title: fit a negative binomial model with lasso (or elastic net), snet
###   and mnet regularization
### Aliases: glmregNB glmregNegbin
### Keywords: models regression

### ** Examples

## Not run: 
##D data("bioChemists", package = "pscl")
##D fm_nb <- glmregNB(art ~ ., data = bioChemists)
##D coef(fm_nb)
##D ### ridge regression
##D fm <- glmregNB(art ~ ., alpha=0, data = bioChemists, lambda=seq(0.001, 1, by=0.01))
##D fm <- cv.glmregNB(art ~ ., alpha=0, data = bioChemists, lambda=seq(0.001, 1, by=0.01))
## End(Not run)



