library(COUNT)


### Name: rwm1984
### Title: rwm1984
### Aliases: rwm1984
### Keywords: datasets

### ** Examples

library(MASS)
library(msme)
data(rwm1984)

glmrp <- glm(docvis ~ outwork + female + age + factor(edlevel), family=poisson, data=rwm1984)
summary(glmrp)
exp(coef(glmrp))

summary(nb2 <- nbinomial(docvis ~ outwork + female + age + factor(edlevel), data=rwm1984))
exp(coef(nb2))

summary(glmrnb <- glm.nb(docvis ~ outwork + female + age + factor(edlevel), data=rwm1984))
exp(coef(glmrnb))



