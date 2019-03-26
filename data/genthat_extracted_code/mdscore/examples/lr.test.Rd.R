library(mdscore)


### Name: lr.test
### Title: Likelihood ratio test for generalized linear models
### Aliases: lr.test
### Keywords: likelihood ratio glm

### ** Examples

data(strength)
fitf <- glm(y ~ cut * lot, data = strength,family = inverse.gaussian("inverse"))
fit0 <- glm(y ~ cut + lot, data = strength, family = inverse.gaussian("inverse"))
lr.test(fit0,fitf)



