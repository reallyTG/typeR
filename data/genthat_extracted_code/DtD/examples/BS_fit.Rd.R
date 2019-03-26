library(DtD)


### Name: BS_fit
### Title: Fit Black-Scholes Parameters
### Aliases: BS_fit

### ** Examples

library(DtD)
set.seed(83486778)
sims <- BS_sim(
  vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1, D = rep(80, 20), r = .01)

with(sims,
     BS_fit(S = S, D = D, T. = T, r = r, time = time, method = "mle"))




