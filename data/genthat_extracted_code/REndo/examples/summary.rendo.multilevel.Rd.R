library(REndo)


### Name: summary.rendo.multilevel
### Title: Summarizing Multilevel GMM Estimation with Endogenous Regressors
###   Model Fits
### Aliases: summary.rendo.multilevel

### ** Examples


data(dataMultilevelIV)
# Fit two levels model
res.ml.L2 <- multilevelIV(y ~ X11 + X12 + X13 + X14 + X15 + X21 + X22 + X23 + X24 + X31 +
                              X32 + X33 + (1|SID) | endo(X15),
                          data = dataMultilevelIV, verbose = FALSE)

# Get summary for FE_L2 (does not print)
res.sum <- summary(res.ml.L2, model = "FE_L2")
# extract table with coefficients summary statistics
sum.stat.FE_L2 <- coef(res.sum)
# extract vcov of model FE_L2
FE_L2.vcov <- vcov(res.sum)
# same as above
FE_L2.vcov <- vcov(res.ml.L2, model = "FE_L2")




