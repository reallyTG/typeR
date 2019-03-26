library(COUNT)


### Name: loomis
### Title: loomis
### Aliases: loomis
### Keywords: datasets

### ** Examples

data(loomis)
glmlmp <- glm(anvisits ~ gender + factor(income) + factor(travel), family=poisson, data=loomis)
summary(glmlmp)
exp(coef(glmlmp))
library(MASS)
glmlmnb <- glm.nb(anvisits ~ gender + factor(income) + factor(travel), data=loomis)
summary(glmlmnb)
exp(coef(glmlmnb))



