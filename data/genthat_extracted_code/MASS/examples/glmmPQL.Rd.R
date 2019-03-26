library(MASS)


### Name: glmmPQL
### Title: Fit Generalized Linear Mixed Models via PQL
### Aliases: glmmPQL
### Keywords: models

### ** Examples

library(nlme) # will be loaded automatically if omitted
summary(glmmPQL(y ~ trt + I(week > 2), random = ~ 1 | ID,
                family = binomial, data = bacteria))
## Don't show: 
 # an example of offset
summary(glmmPQL(y ~ trt + week, random = ~ 1 | ID,
                family = binomial, data = bacteria))
summary(glmmPQL(y ~ trt + week + offset(week), random = ~ 1 | ID,
                family = binomial, data = bacteria))
## End(Don't show)


