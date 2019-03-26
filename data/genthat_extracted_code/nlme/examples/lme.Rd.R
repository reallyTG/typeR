library(nlme)


### Name: lme
### Title: Linear Mixed-Effects Models
### Aliases: lme lme.formula update.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, data = Orthodont) # random is ~ age
fm2 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
summary(fm1)
summary(fm2)



