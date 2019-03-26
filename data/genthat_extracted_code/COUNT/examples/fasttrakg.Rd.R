library(COUNT)


### Name: fasttrakg
### Title: fasttrakg
### Aliases: fasttrakg
### Keywords: datasets

### ** Examples

library(MASS)
data(fasttrakg)
glmfp <- glm(die ~ anterior + factor(killip) + offset(log(cases)), family=poisson, data=fasttrakg)
summary(glmfp)
exp(coef(glmfp))




