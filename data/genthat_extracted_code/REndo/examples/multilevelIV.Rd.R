library(REndo)


### Name: multilevelIV
### Title: Fitting Multilevel GMM Estimation with Endogenous Regressors
### Aliases: multilevelIV

### ** Examples

## No test: 
data(dataMultilevelIV)

# Two levels
res.ml.L2 <- multilevelIV(y ~ X11 + X12 + X13 + X14 + X15 + X21 + X22 + X23 + X24 + X31 +
                              X32 + X33 + (1|SID) | endo(X15),
                          data = dataMultilevelIV, verbose = FALSE)

# Three levels
res.ml.L3 <- multilevelIV(y ~ X11 + X12 + X13 + X14 + X15 + X21 + X22 + X23 + X24 + X31 +
                              X32 + X33 + (1| CID) + (1|SID) | endo(X15),
                          data = dataMultilevelIV, verbose = FALSE)


# L2 with multiple endogenous regressors
res.ml.L2 <- multilevelIV(y ~ X11 + X12 + X13 + X14 + X15 + X21 + X22 + X23 + X24 + X31 +
                              X32 + X33 + (1|SID) | endo(X15, X21, X22),
                          data = dataMultilevelIV, verbose = FALSE)

# same as above
res.ml.L2 <- multilevelIV(y ~ X11 + X12 + X13 + X14 + X15 + X21 + X22 + X23 + X24 + X31 +
                              X32 + X33 + (1|SID) | endo(X15, X21) + endo(X22),
                          data = dataMultilevelIV, verbose = FALSE)


# specify argument "model" in the S3 methods to obtain results for the respective model
# default is "REF" for all methods

summary(res.ml.L3)
# same as above
summary(res.ml.L3, model = "REF")

# complete pval table for L3 fixed effects
L3.FE.p <- coef(summary(res.ml.L3, model = "FE_L3"))

# variance covariance matrix
L2.FE.var  <- vcov(res.ml.L2, model = "FE_L2")
L2.GMM.var <- vcov(res.ml.L2, model = "GMM_L2")
# residuals
L3.REF.resid <- resid(res.ml.L3, model = "REF")
## End(No test)




