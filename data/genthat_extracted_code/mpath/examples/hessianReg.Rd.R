library(mpath)


### Name: hessianReg
### Title: Hessian Matrix of Regularized Estimators
### Aliases: hessianReg
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm_zinb <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
hessianReg(fm_zinb, which=which.min(fm_zinb$bic))



