library(nlme)


### Name: compareFits
### Title: Compare Fitted Objects
### Aliases: compareFits print.compareFits
### Keywords: models

### ** Examples

fm1 <- lmList(Orthodont)
fm2 <- lme(fm1)
compareFits(coef(fm1), coef(fm2))



