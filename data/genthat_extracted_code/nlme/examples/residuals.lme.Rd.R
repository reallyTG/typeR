library(nlme)


### Name: residuals.lme
### Title: Extract lme Residuals
### Aliases: residuals.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
head(residuals(fm1, level = 0:1))
summary(residuals(fm1) /
        residuals(fm1, type = "p")) # constant scaling factor 1.432



