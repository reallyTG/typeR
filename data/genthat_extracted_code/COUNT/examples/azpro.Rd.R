library(COUNT)


### Name: azpro
### Title: azpro
### Aliases: azpro
### Keywords: datasets

### ** Examples

data(azpro)
glmazp <- glm(los ~ procedure + sex + admit, family=poisson, data=azpro)
summary(glmazp)
exp(coef(glmazp))
#glmaznb < -glm.nb(los ~ procedure + sex + admit, data=azpro)
#summary(glmaznb)
#exp(coef(glmaznb))



