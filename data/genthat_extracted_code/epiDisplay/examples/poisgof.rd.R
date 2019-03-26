library(epiDisplay)


### Name: poisgof
### Title: Goodness of fit test for modeling of count data
### Aliases: poisgof
### Keywords: htest

### ** Examples

library(MASS)
quine.pois <- glm(Days ~ Sex/(Age + Eth*Lrn), data = quine, family=poisson)
poisgof(quine.pois)
quine.nb1 <- glm.nb(Days ~ Sex/(Age + Eth*Lrn), data = quine)
poisgof(quine.nb1)



