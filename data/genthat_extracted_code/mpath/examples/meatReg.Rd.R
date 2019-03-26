library(mpath)


### Name: meatReg
### Title: Meat Matrix Estimator
### Aliases: meatReg
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm_zinb <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
meatReg(fm_zinb, which=which.min(fm_zinb$bic))



