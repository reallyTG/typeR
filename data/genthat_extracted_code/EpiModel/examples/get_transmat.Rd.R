library(EpiModel)


### Name: is.transmat
### Title: Extract Transmissions Matrix from Network Epidemic Model
### Aliases: is.transmat transmat get_transmat
### Keywords: extract

### ** Examples

## Simulate SI epidemic on bipartite Bernoulli random graph
nw <- network.initialize(n = 100, bipartite = 50, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)
est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15)
init <- init.net(i.num = 10, i.num.m2 = 10)
control <- control.net(type = "SI", nsteps = 10, nsims = 3, verbose = FALSE)
mod <- netsim(est, param, init, control)

## Extract the transmission matrix from simulation 2
get_transmat(mod, sim = 2)




