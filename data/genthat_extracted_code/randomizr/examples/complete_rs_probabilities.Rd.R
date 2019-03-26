library(randomizr)


### Name: complete_rs_probabilities
### Title: Inclusion Probabilities: Complete Random Sampling
### Aliases: complete_rs_probabilities

### ** Examples

probs <- complete_rs_probabilities(N = 100)
table(probs)

probs <- complete_rs_probabilities(N = 100, n = 50)
table(probs)

probs <- complete_rs_probabilities(N=100, prob = .3)
table(probs)




