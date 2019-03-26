library(nlme)


### Name: coef.lmList
### Title: Extract lmList Coefficients
### Aliases: coef.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age|Subject, data = Orthodont)
coef(fm1)
coef(fm1, augFrame = TRUE)



