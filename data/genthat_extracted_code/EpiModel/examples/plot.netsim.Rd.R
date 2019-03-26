library(EpiModel)


### Name: plot.netsim
### Title: Plot Data from a Stochastic Network Epidemic Model
### Aliases: plot.netsim
### Keywords: plot

### ** Examples

## Independent SI Model
# Initialize network and set network model parameters
nw <- network.initialize(n = 100, bipartite = 50, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)

# Estimate the network model
est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

# Simulate the epidemic model
param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15)
init <- init.net(i.num = 10, i.num.m2 = 10)
control <- control.net(type = "SI", nsteps = 20, nsims = 3,
                       verbose = FALSE, save.nwstats = TRUE,
                       nwstats.formula = ~edges + meandeg + concurrent)
mod <- netsim(est, param, init, control)

# Plot epidemic trajectory
plot(mod)
plot(mod, type = "epi", grid = TRUE)
plot(mod, type = "epi", popfrac = TRUE)
plot(mod, type = "epi", y = "si.flow", qnts = 1, ylim = c(0, 4))

# Plot static networks
par(mar = c(0,0,0,0))
plot(mod, type = "network")

# Automatic coloring of infected nodes as red
par(mfrow = c(1, 2), mar = c(0, 0, 2, 0))
plot(mod, type = "network", main = "Min Prev | Time 50",
     col.status = TRUE, at = 20, sims = "min")
plot(mod, type = "network", main = "Max Prev | Time 50",
     col.status = TRUE, at = 20, sims = "max")

# Automatic shape by mode number (circle = mode 1)
par(mar = c(0,0,0,0))
plot(mod, type = "network", at = 20, col.status = TRUE, shp.bip = "square")
plot(mod, type = "network", at = 20, col.status = TRUE, shp.bip = "triangle")

# Plot formation statistics
par(mfrow = c(1,1), mar = c(3,3,1,1), mgp = c(2,1,0))
plot(mod, type = "formation", grid = TRUE)
plot(mod, type = "formation", plots.joined = FALSE)
plot(mod, type = "formation", sims = 2:3)
plot(mod, type = "formation", plots.joined = FALSE,
     stats = c("edges", "concurrent"))
plot(mod, type = "formation", stats = "meandeg",
     mean.lwd = 1, qnts.col = "seagreen", mean.col = "black")




