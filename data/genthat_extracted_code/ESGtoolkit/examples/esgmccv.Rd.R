library(ESGtoolkit)


### Name: esgmccv
### Title: Convergence of Monte Carlo prices
### Aliases: esgmccv

### ** Examples

r <- 0.03

set.seed(1)
eps0 <- simshocks(n = 100, horizon = 5, frequency = "quart")
sim.GBM <- simdiff(n = 100, horizon = 5, frequency = "quart",
               model = "GBM",
               x0 = 100, theta1 = 0.03, theta2 = 0.1,
               eps = eps0)

# monte carlo prices
esgmcprices(r, sim.GBM)

# convergence to a specific price
(esgmccv(r, sim.GBM, 2))



