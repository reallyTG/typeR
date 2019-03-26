library(evidence)


### Name: budworm
### Title: Mortality data of moth larvae due to increasing doses of
###   insecticide.
### Aliases: budworm
### Keywords: datasets

### ** Examples

data(budworm)
fit <- glm(cbind(dead, 20 - dead) ~ ldose, data=budworm,
family=binomial)
summary(fit)



