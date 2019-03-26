library(mpath)


### Name: predict.zipath
### Title: Methods for zipath Objects
### Aliases: predict.zipath residuals.zipath terms.zipath
###   model.matrix.zipath coef.zipath summary.zipath print.summary.zipath
###   logLik.zipath fitted.zipath predprob.zipath
### Keywords: regression

### ** Examples

## Not run: 
##D data("bioChemists", package = "pscl")
##D fm_zip <- zipath(art ~ . | ., data = bioChemists, nlambda=10)
##D plot(residuals(fm_zip) ~ fitted(fm_zip))
##D coef(fm_zip, model = "count")
##D coef(fm_zip, model = "zero")
##D summary(fm_zip)
##D logLik(fm_zip)
## End(Not run)



