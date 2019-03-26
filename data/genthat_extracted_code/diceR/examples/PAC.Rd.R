library(diceR)


### Name: PAC
### Title: Proportion of Ambiguous Clustering
### Aliases: PAC

### ** Examples

set.seed(1)
x <- replicate(100, rbinom(100, 4, 0.2))
y <- consensus_matrix(x)
PAC(y, lower = 0.05, upper = 0.95)



