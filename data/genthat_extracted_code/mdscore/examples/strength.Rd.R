library(mdscore)


### Name: strength
### Title: Impact Strength an Insulating Material
### Aliases: strength
### Keywords: datasets

### ** Examples

data(strength)
fitf <- glm(y ~ cut * lot, data = strength,family = inverse.gaussian("inverse"))
summary(fitf)
X <- model.matrix(fitf, data = strength)
fit0 <- glm(y ~ cut + lot, data = strength, family = inverse.gaussian("inverse"))
test <- mdscore(fit0, X1=X[, 7:10])
summary(test)



