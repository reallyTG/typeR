library(nlme)


### Name: coef.lme
### Title: Extract lme Coefficients
### Aliases: coef.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
coef(fm1)
coef(fm1, augFrame = TRUE)



