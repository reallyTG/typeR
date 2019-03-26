library(EpiModel)


### Name: get_nwstats
### Title: Extract Network Statistics from netsim or netdx Object
### Aliases: get_nwstats
### Keywords: extract

### ** Examples

# Bipartite Bernoulli random graph TERGM
nw <- network.initialize(n = 100, bipartite = 50, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)
est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

dx <- netdx(est, nsim = 3, nsteps = 10, verbose = FALSE,
            nwstats.formula = ~edges + isolates)
get_nwstats(dx)
get_nwstats(dx, sim = 1)

# SI epidemic model
param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15)
init <- init.net(i.num = 10, i.num.m2 = 10)
control <- control.net(type = "SI", nsteps = 10, nsims = 3,
                       nwstats.formula = ~edges + meandeg + degree(0:5),
                       verbose = FALSE)
mod <- netsim(est, param, init, control)

# Extract the network statistics from all or sets of simulations
get_nwstats(mod)
get_nwstats(mod, sim = 2)
get_nwstats(mod, sim = c(1, 3))

# On the fly summary stats
summary(get_nwstats(mod))
colMeans(get_nwstats(mod))




