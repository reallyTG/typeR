library(ESGtoolkit)


### Name: esgmcprices
### Title: Estimation of discounted asset prices
### Aliases: esgmcprices

### ** Examples

# GBM

r <- 0.03

eps0 <- simshocks(n = 100, horizon = 5, frequency = "quart")
sim.GBM <- simdiff(n = 100, horizon = 5, frequency = "quart",
               model = "GBM",
               x0 = 100, theta1 = 0.03, theta2 = 0.1,
               eps = eps0)

# monte carlo prices
esgmcprices(r, sim.GBM)

# monte carlo price for a given maturity
esgmcprices(r, sim.GBM, 2)



