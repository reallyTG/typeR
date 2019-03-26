library(nlme)


### Name: comparePred
### Title: Compare Predictions
### Aliases: comparePred comparePred.gls comparePred.lme comparePred.lmList
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age * Sex, data = Orthodont, random = ~ age)
fm2 <- update(fm1, distance ~ age)
comparePred(fm1, fm2, length.out = 2)



