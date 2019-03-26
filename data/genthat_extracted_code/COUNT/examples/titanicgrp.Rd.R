library(COUNT)


### Name: titanicgrp
### Title: titanicgrp
### Aliases: titanicgrp
### Keywords: datasets

### ** Examples

library(MASS)
library(msme)
data(titanicgrp)
glmlr <- glm(survive ~ age + sex + factor(class) + offset(log(cases)),
             family=poisson, data=titanicgrp)
summary(glmlr)
exp(coef(glmlr))

lcases <- titanicgrp$cases
nb2o <- nbinomial(survive ~ age + sex + factor(class), 
                                        formula2 =~ age + sex,
                                        offset = lcases,
                                        mean.link="log",
                                        scale.link="log_s",
                                        data=titanicgrp)
summary(nb2o)
exp(coef(nb2o))




