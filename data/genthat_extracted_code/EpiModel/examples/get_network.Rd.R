library(EpiModel)


### Name: get_network
### Title: Extract networkDynamic and network Objects from Network
###   Simulations
### Aliases: get_network
### Keywords: extract

### ** Examples

# Set up network and TERGM formiula
nw <- network.initialize(n = 100, bipartite = 50, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)

# Estimate the model
est <- netest(nw, formation, target.stats, coef.diss)

# Run diagnostics, saving the networkDynamic objects
dx <- netdx(est, nsteps = 10, nsims = 3, keep.tnetwork = TRUE, verbose = FALSE)

# Extract the network for simulation 2 from dx object
get_network(dx, sim = 2)

# Extract and collapse the network from simulation 1 at time step 5
get_network(dx, collapse = TRUE, at = 5)

# Parameterize the epidemic model, and simulate it
param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15)
init <- init.net(i.num = 10, i.num.m2 = 10)
control <- control.net(type = "SI", nsteps = 10, nsims = 3, verbose = FALSE)
mod <- netsim(est, param, init, control)

# Extract the network for simulation 2 from mod object
get_network(mod, sim = 2)

## Extract and collapse the network from simulation 1 at time step 5
get_network(mod, collapse = TRUE, at = 5)




