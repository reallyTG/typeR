library(nlme)


### Name: getVarCov
### Title: Extract variance-covariance matrix
### Aliases: getVarCov getVarCov.lme getVarCov.gls print.VarCov
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, data = Orthodont, subset = Sex == "Female")
getVarCov(fm1)
getVarCov(fm1, individual = "F01", type = "marginal")
getVarCov(fm1, type = "conditional")
fm2 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
getVarCov(fm2)



