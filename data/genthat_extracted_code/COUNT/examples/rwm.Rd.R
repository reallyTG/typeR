library(COUNT)


### Name: rwm
### Title: rwm
### Aliases: rwm
### Keywords: datasets

### ** Examples

data(rwm)
glmrwp <- glm(docvis ~ age + educ + hhninc, family=poisson, data=rwm)
summary(glmrwp)
exp(coef(glmrwp))
library(MASS)
glmrwnb <- glm.nb(docvis ~ age + educ + hhninc, data=rwm)
summary(glmrwnb)
exp(coef(glmrwnb))



