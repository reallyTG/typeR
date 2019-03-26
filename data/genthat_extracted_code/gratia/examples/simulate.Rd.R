library(gratia)


### Name: simulate.gam
### Title: Simulate from the posterior distribution of a GAM
### Aliases: simulate.gam simulate.gamm simulate.scam

### ** Examples

library("mgcv")
## Don't show: 
set.seed(2)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

sims <- simulate(m1, nsim = 5, seed = 42)
head(sims)



