library(MASS)


### Name: glm.convert
### Title: Change a Negative Binomial fit to a GLM fit
### Aliases: glm.convert
### Keywords: regression models

### ** Examples

quine.nb1 <- glm.nb(Days ~ Sex/(Age + Eth*Lrn), data = quine)
quine.nbA <- glm.convert(quine.nb1)
quine.nbB <- update(quine.nb1, . ~ . + Sex:Age:Lrn)
anova(quine.nbA, quine.nbB)



