library(DtD)


### Name: BS_sim
### Title: Simulate Stock Price and Price of Underlying Asset
### Aliases: BS_sim

### ** Examples

library(DtD)
set.seed(79156879)
sims <- BS_sim(
  vol = .1, mu = .05, dt = .2, V_0 = 100, T. = 1, D = rep(80, 20), r = .01)

# plot underlying
plot(sims$V)

# plot stock
plot(sims$S)




