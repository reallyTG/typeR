library(diceR)


### Name: consensus_matrix
### Title: Consensus matrix
### Aliases: consensus_matrix

### ** Examples

set.seed(2)
x <- replicate(100, rbinom(100, 4, 0.2))
w <- rexp(100)
w <- w / sum(w)
cm1 <- consensus_matrix(x)
cm2 <- consensus_matrix(x, weights = w)



