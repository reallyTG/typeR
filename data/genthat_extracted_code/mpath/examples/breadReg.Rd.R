library(mpath)


### Name: breadReg
### Title: Bread for Sandwiches in Regularized Estimators
### Aliases: breadReg breadReg.zipath
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm_zinb <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
breadReg(fm_zinb, which=which.min(fm_zinb$bic))



