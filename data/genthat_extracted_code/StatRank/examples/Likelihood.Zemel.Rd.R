library(StatRank)


### Name: Likelihood.Zemel
### Title: Gives Zemel pairwise Log-likelihood with data and scores
### Aliases: Likelihood.Zemel

### ** Examples

Estimate <- Generate.Zemel.Parameters(10)
pairs <- Generate.Zemel.Ranks.Pairs(Estimate$Score, 10, 10)
Likelihood.Zemel(pairs, Estimate)



