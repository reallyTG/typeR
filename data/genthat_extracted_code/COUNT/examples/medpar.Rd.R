library(COUNT)


### Name: medpar
### Title: medpar
### Aliases: medpar
### Keywords: datasets

### ** Examples

library(MASS)
library(msme)
data(medpar)
glmp <- glm(los ~ hmo + white + factor(type), family=poisson, data=medpar)
summary(glmp)
exp(coef(glmp))
nb2 <- nbinomial(los ~ hmo + white + factor(type), data=medpar)
summary(nb2)
exp(coef(nb2))
glmnb <- glm.nb(los ~ hmo + white + factor(type), data=medpar)
summary(glmnb)
exp(coef(glmnb))




