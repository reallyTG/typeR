library(contrast)


### Name: contrast.lm
### Title: General Contrasts of Regression Coefficients
### Aliases: contrast contrast.lm contrast.gls contrast.lme contrast.geese
###   print.contrast
### Keywords: models regression

### ** Examples

library(nlme)
Orthodont2 <- Orthodont
Orthodont2$newAge <- Orthodont$age - 11
fm1Orth.lme2 <- lme(distance ~ Sex*newAge, data = Orthodont2, random = ~ newAge | Subject)
summary(fm1Orth.lme2)

contrast(fm1Orth.lme2,
         a = list(Sex = levels(Orthodont2$Sex), newAge = 8 - 11),
         b = list(Sex = levels(Orthodont2$Sex), newAge = 10 - 11))




