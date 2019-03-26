library(mdscore)


### Name: mdscore
### Title: Modified score test for generalized linear models
### Aliases: mdscore
### Keywords: mdscore score glm

### ** Examples

data(strength)
fitf <- glm(y ~ cut * lot, data = strength,family = inverse.gaussian("inverse"))
summary(fitf)
X <- model.matrix(fitf, data = strength)
fit0 <- glm(y ~ cut + lot, data = strength, family = inverse.gaussian("inverse"))
mdscore(fit0, X1=X[, 7:10])



