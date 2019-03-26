library(mpath)


### Name: tuning.zipath
### Title: find optimal path for penalized zero-inflated model
### Aliases: tuning.zipath
### Keywords: models regression

### ** Examples

## Not run: 
##D ## data
##D data("bioChemists", package = "pscl")
##D 
##D ## inflation with regressors
##D ## ("art ~ . | ." is "art ~ fem + mar + kid5 + phd + ment | fem + mar + kid5 + phd + ment")
##D fm_zip2 <- tuning.zipath(art ~ . | ., data = bioChemists, nlambda=10)
##D summary(fm_zip2)
##D fm_zinb2 <- tuning.zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
##D summary(fm_zinb2)
## End(Not run)



