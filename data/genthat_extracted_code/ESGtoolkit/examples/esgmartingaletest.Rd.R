library(ESGtoolkit)


### Name: esgmartingaletest
### Title: Martingale and market consistency tests
### Aliases: esgmartingaletest

### ** Examples

r0 <- 0.03
S0 <- 100

set.seed(10)
eps0 <- simshocks(n = 100, horizon = 3, frequency = "quart")
sim.GBM <- simdiff(n = 100, horizon = 3, frequency = "quart",
               model = "GBM",
               x0 = S0, theta1 = r0, theta2 = 0.1,
               eps = eps0)

mc.test <- esgmartingaletest(r = r0, X = sim.GBM, p0 = S0, alpha = 0.05)
esgplotbands(mc.test)



