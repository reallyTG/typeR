library(randomizr)


### Name: strata_rs
### Title: Stratified Random Sampling
### Aliases: strata_rs

### ** Examples


strata <- rep(c("A", "B","C"), times = c(50, 100, 200))
Z <- strata_rs(strata = strata)
table(strata, Z)

Z <- strata_rs(strata = strata, prob = .3)
table(strata, Z)

Z <- strata_rs(strata = strata, n = 20)
table(strata, Z)

Z <- strata_rs(strata = strata, strata_prob = c(.1, .2, .3))
table(strata, Z)

Z <- strata_rs(strata = strata, strata_n = c(20, 30, 40))
table(strata, Z)





