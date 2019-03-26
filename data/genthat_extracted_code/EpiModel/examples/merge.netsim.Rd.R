library(EpiModel)


### Name: merge.netsim
### Title: Merge Model Simulations Across netsim Objects
### Aliases: merge.netsim
### Keywords: extract

### ** Examples

# Network model
nw <- network.initialize(n = 100, directed = FALSE)
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 10)
est <- netest(nw, formation = ~edges, target.stats = 25,
              coef.diss = coef.diss, verbose = FALSE)

# Epidemic models
param <- param.net(inf.prob = 1)
init <- init.net(i.num = 1)
control <- control.net(type = "SI", nsteps = 20, nsims = 2,
                       save.nwstats = TRUE,
                       nwstats.formula = ~edges + degree(0),
                       verbose = FALSE)
x <- netsim(est, param, init, control)
y <- netsim(est, param, init, control)

# Merging
z <- merge(x, y)
x$epi
y$epi
z$epi




