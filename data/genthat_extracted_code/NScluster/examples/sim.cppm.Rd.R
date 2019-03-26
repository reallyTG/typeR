library(NScluster)


### Name: sim.cppm
### Title: Simulation for Neyman-Scott Cluster Point Process Models and
###   Their Extensions
### Aliases: sim.cppm print.sim.cpp plot.sim.cpp
### Keywords: spatial

### ** Examples

## Thomas Model
pars <- c(mu = 50.0, nu = 30.0, sigma = 0.03)
t.sim <- sim.cppm("Thomas", pars, seed = 117)
t.sim
plot(t.sim)

## Inverse-Power Type Model
pars <- c(mu = 50.0, nu = 30.0, p = 1.5, c = 0.005)
ip.sim <- sim.cppm("IP", pars, seed = 353)
ip.sim
plot(ip.sim)

## Type A Model
pars <- c(mu = 50.0, nu = 30.0, a = 0.3, sigma1 = 0.005, sigma2 = 0.1)
a.sim <- sim.cppm("TypeA", pars, seed = 575)
a.sim
plot(a.sim)

## Type B Model
pars <- c(mu1 = 10.0, mu2 = 40.0, nu = 30.0, sigma1 = 0.01, sigma2 = 0.03)
b.sim <- sim.cppm("TypeB", pars, seed = 257)
b.sim
plot(b.sim, parents.distinct = TRUE)

## Type C Model
pars <- c(mu1 = 5.0, mu2 = 9.0, nu1 = 30.0, nu2 = 150.0,
               sigma1 = 0.01, sigma2 = 0.05)
c.sim <- sim.cppm("TypeC", pars, seed = 555)
c.sim
plot(c.sim, parents.distinct = FALSE)



