library(COUNT)


### Name: lbwgrp
### Title: lbwgrp
### Aliases: lbwgrp
### Keywords: datasets

### ** Examples

data(lbwgrp)
glmgp <- glm(lowbw ~ smoke + race2 + race3 + offset(log(cases)), family=poisson, data=lbwgrp)
summary(glmgp)
exp(coef(glmgp))
library(MASS)
glmgnb <- glm.nb(lowbw ~  smoke + race2 + race3, data=lbwgrp)
summary(glmgnb)
exp(coef(glmgnb))



