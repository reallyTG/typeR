library(DtD)


### Name: BS_call
### Title: European Call Option Price and the Inverse
### Aliases: BS_call get_underlying

### ** Examples

library(DtD)
set.seed(58661382)
sims <- BS_sim(
  vol = .2, mu = .03, dt = .1, V_0 = 100, T. = 1, D = rep(80, 20), r = .01)

stopifnot(with(
  sims, isTRUE(all.equal(V, get_underlying(S, D, T, r, vol)))))
stopifnot(with(
  sims, isTRUE(all.equal(S, BS_call(V, D, T, r, vol)))))




