library(gcKrig)


### Name: simgc
### Title: Simulate Geostatistical Data from Gaussian Copula Model at Given
###   Locations
### Aliases: simgc
### Keywords: Simulation

### ** Examples

grid <- seq(0.05, 0.95, by = 0.1)
xloc <- expand.grid(x = grid, y = grid)[,1]
yloc <- expand.grid(x = grid, y = grid)[,2]
set.seed(12345)
sim1 <- simgc(locs = cbind(xloc,yloc), sim.n = 10, marginal = negbin.gc(mu = 5, od = 1),
              corr = matern.gc(range = 0.3, kappa = 0.5, nugget = 0.1))
#plot(sim1, index = 1)



