library(mpath)


### Name: cv.zipath
### Title: Cross-validation for zipath
### Aliases: cv.zipath coef.cv.zipath
### Keywords: models regression

### ** Examples

## Not run: 
##D data("bioChemists", package = "pscl")
##D fm_zip <- cv.zipath(art ~ . | ., data = bioChemists, family = "poisson", nlambda=10)
##D ### prediction from the best model
##D coef(fm_zip)
##D fm_zip_predict <- predict(object=fm_zip$fit, which=fm_zip$lambda.which, type="response", 
##D model=c("full"))
##D fm_znb <- cv.zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
##D coef(fm_znb)
## End(Not run)



