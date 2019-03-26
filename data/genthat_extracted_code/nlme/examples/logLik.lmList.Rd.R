library(nlme)


### Name: logLik.lmList
### Title: Log-Likelihood of an lmList Object
### Aliases: logLik.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age | Subject, Orthodont)
logLik(fm1)   # returns NA when it should not



