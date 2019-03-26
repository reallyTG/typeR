library(randomizr)


### Name: strata_rs_probabilities
### Title: Inclusion Probabilities: Stratified Random Sampling
### Aliases: strata_rs_probabilities

### ** Examples


strata <- rep(c("A", "B","C"), times = c(50, 100, 200))
probs <- strata_rs_probabilities(strata = strata)
table(strata, probs)

probs <- strata_rs_probabilities(strata = strata, prob = .2)
table(strata, probs)

probs <- strata_rs_probabilities(strata = strata, strata_prob = c(.1, .2, .3))
table(strata, probs)

probs <- strata_rs_probabilities(strata = strata, strata_n = c(10, 40, 70))
table(strata, probs)




