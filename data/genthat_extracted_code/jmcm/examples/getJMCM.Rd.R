library(jmcm)


### Name: getJMCM
### Title: Extract or Get Generalized Components from a Fitted Joint Mean
###   Covariance Model
### Aliases: getJMCM getJMCM.jmcmMod

### ** Examples

fit.mcd <- jmcm(I(sqrt(cd4)) | id | time ~ 1 | 1, data = aids,
  triple = c(8, 1, 3), cov.method = 'mcd')

beta <- getJMCM(fit.mcd, "beta")
BIC  <- getJMCM(fit.mcd, "BIC")
Di   <- getJMCM(fit.mcd, "D", 10)




