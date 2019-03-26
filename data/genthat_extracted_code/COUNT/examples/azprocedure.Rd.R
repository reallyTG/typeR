library(COUNT)


### Name: azprocedure
### Title: azprocedure
### Aliases: azprocedure
### Keywords: datasets

### ** Examples

library(MASS)
library(msme)

data(azprocedure)

glmazp <- glm(los ~ procedure + sex + admit, family=poisson, data=azprocedure)
summary(glmazp)
exp(coef(glmazp))

nb2 <- nbinomial(los ~ procedure + sex + admit, data=azprocedure)
summary(nb2)
exp(coef(nb2))

glmaznb <- glm.nb(los ~ procedure + sex + admit, data=azprocedure)
summary(glmaznb)
exp(coef(glmaznb))



