library(mdscore)


### Name: wald.test
### Title: Wald test for generalized linear models
### Aliases: wald.test
### Keywords: Wald glm

### ** Examples

data(strength)
fitf <- glm(y ~ cut * lot, data = strength,family = inverse.gaussian("inverse"))
wald.test(fitf,term=9)



