library(nlme)


### Name: logLik.lme
### Title: Log-Likelihood of an lme Object
### Aliases: logLik.lme logLik.gls
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ Sex * age, Orthodont, random = ~ age, method = "ML")
logLik(fm1)
logLik(fm1, REML = TRUE)



