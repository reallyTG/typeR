library(EpiModel)


### Name: get_sims
### Title: Extract Network Simulations
### Aliases: get_sims
### Keywords: extract

### ** Examples

# Network model estimation
nw <- network.initialize(n = 100, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)
est1 <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

# Epidemic model
param <- param.net(inf.prob = 0.3)
init <- init.net(i.num = 10)
control <- control.net(type = "SI", nsteps = 10, nsims = 3, verbose.int = 0)
mod1 <- netsim(est1, param, init, control)

# Get sim 2
sim2 <- get_sims(mod1, sims = 2)

# Get sims 2 and 3 and keep only a subset of variables
sim2.small <- get_sims(mod1, sims = 2:3, var = c("i.num", "si.flow"))

# Extract the mean simulation for the variable i.num
sim.mean <- get_sims(mod1, sims = "mean", var = "i.num")




