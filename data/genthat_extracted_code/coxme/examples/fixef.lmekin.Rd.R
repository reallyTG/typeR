library(coxme)


### Name: fixef.lmekin
### Title: Extraction functions for Lmekin
### Aliases: fixef.lmekin ranef.lmekin vcov.lmekin VarCorr.lmekin
###   logLik.lmekin
### Keywords: models

### ** Examples

data(ergoStool, package="nlme")  # use a data set from nlme
efit <-  lmekin(effort ~ Type + (1|Subject), ergoStool)
ranef(efit)



