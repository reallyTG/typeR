library(nlme)


### Name: pairs.compareFits
### Title: Pairs Plot of compareFits Object
### Aliases: pairs.compareFits
### Keywords: models

### ** Examples

fm1 <- lmList(Orthodont)
fm2 <- lme(Orthodont)
pairs(compareFits(coef(fm1), coef(fm2)))



