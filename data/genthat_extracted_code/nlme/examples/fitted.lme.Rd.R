library(nlme)


### Name: fitted.lme
### Title: Extract lme Fitted Values
### Aliases: fitted.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
fitted(fm1, level = 0:1)



