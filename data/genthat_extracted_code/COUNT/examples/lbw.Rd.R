library(COUNT)


### Name: lbw
### Title: lbw
### Aliases: lbw
### Keywords: datasets

### ** Examples

data(lbw)
glmbwp <- glm(ftv ~ low + smoke + factor(race), family=poisson, data=lbw)
summary(glmbwp)
exp(coef(glmbwp))
library(MASS)
glmbwnb <- glm.nb(ftv ~ low + smoke + factor(race), data=lbw)
summary(glmbwnb)
exp(coef(glmbwnb))



