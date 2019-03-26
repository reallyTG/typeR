library(COUNT)


### Name: azdrg112
### Title: azdrg112
### Aliases: azdrg112
### Keywords: datasets

### ** Examples

data(azdrg112)
glmazp <- glm(los ~ type1 + gender + age75, family=poisson, data=azdrg112)
summary(glmazp)
exp(coef(glmazp))
library(MASS)
glmaznb <- glm.nb(los ~ type1 + gender + age75, data=azdrg112)
summary(glmaznb)
exp(coef(glmaznb))



