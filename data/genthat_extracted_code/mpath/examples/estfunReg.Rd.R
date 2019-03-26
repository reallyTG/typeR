library(mpath)


### Name: estfunReg
### Title: Extract Empirical First Derivative of Log-likelihood Function
### Aliases: estfunReg estfunReg.zipath
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm_zinb <- zipath(art ~ . | ., data = bioChemists, family = "negbin", nlambda=10)
res <- estfunReg(fm_zinb, which=which.min(fm_zinb$bic))



