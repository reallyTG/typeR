library(discreteRV)


### Name: marginal
### Title: Marginal distribution of a joint random variable
### Aliases: marginal

### ** Examples

AandB <- jointRV(outcomes = list(1:3, 0:2), probs = 1:9 / sum(1:9))
marginal(AandB, 1)
marginal(AandB, 2)



