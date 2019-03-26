library(mpath)


### Name: zipath
### Title: Fit zero-inflated count data linear model with lasso (or elastic
###   net), snet or mnet regularization
### Aliases: zipath print.zipath
### Keywords: regression

### ** Examples

## Not run: 
##D ## data
##D data("bioChemists", package = "pscl")
##D 
##D ## without inflation
##D ## ("art ~ ." is "art ~ fem + mar + kid5 + phd + ment")
##D fm_pois <- glmreg(art ~ ., data = bioChemists, family = "poisson")
##D coef(fm_pois)
##D fm_nb <- glmregNB(art ~ ., data = bioChemists)
##D coef(fm_nb)
##D ## with simple inflation (no regressors for zero component)
##D fm_zip <- zipath(art ~ . | 1, data = bioChemists, nlambda=10)
##D summary(fm_zip)
##D fm_zinb <- zipath(art ~ . | 1, data = bioChemists, family = "negbin", nlambda=10)
##D summary(fm_zinb)
##D ## inflation with regressors
##D ## ("art ~ . | ." is "art ~ fem + mar + kid5 + phd + ment | fem + mar + kid5 + phd + ment")
##D fm_zip2 <- zipath(art ~ . | ., data = bioChemists, nlambda=10)
##D summary(fm_zip2)
##D fm_zinb2 <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
##D summary(fm_zinb2)
##D ### non-penalized regression, compare with zeroinfl
##D fm_zinb3 <- zipath(art ~ . | ., data = bioChemists, family = "negbin", 
##D lambda.count=0, lambda.zero=0, reltol=1e-12)
##D summary(fm_zinb3)
##D fm_zinb4 <- zerofinfl(art ~ . | ., data = bioChemists, dist = "negbin")
##D summary(fm_zinb4)
## End(Not run)



