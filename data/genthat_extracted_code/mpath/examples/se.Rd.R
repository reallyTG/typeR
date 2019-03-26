library(mpath)


### Name: se
### Title: Standard Error of Regularized Estimators
### Aliases: se se.zipath
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm_zinb <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
res <- se(fm_zinb, which=which.min(fm_zinb$bic))



