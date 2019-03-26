library(msme)


### Name: medpar
### Title: US national Medicare inpatient hospital database for Arizona
###   patients.
### Aliases: medpar
### Keywords: datasets

### ** Examples

data(medpar)
glmp <- glm(los ~ hmo + white + factor(type),
            family = poisson, data = medpar)
summary(glmp)
exp(coef(glmp))

ml.p <- ml_glm(los ~ hmo + white + factor(type),
               family = "poisson",
               link = "log",
               data = medpar)

summary(ml.p)

library(MASS)
glmnb <- glm.nb(los ~ hmo + white + factor(type),
                data = medpar)
summary(glmnb)
exp(coef(glmnb))




