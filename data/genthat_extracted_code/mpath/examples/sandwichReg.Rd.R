library(mpath)


### Name: sandwichReg
### Title: Making Sandwiches with Bread and Meat for Regularized Estimators
### Aliases: sandwichReg
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm_zinb <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
sandwichReg(fm_zinb, which=which.min(fm_zinb$bic))



