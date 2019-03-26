library(nlme)


### Name: Variogram.lme
### Title: Calculate Semi-variogram for Residuals from an lme Object
### Aliases: Variogram.lme
### Keywords: models

### ** Examples

fm1 <- lme(weight ~ Time * Diet, data=BodyWeight, ~ Time | Rat)
Variogram(fm1, form = ~ Time | Rat, nint = 10, robust = TRUE)



