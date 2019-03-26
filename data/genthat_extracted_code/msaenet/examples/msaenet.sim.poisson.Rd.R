library(msaenet)


### Name: msaenet.sim.poisson
### Title: Generate Simulation Data for Benchmarking Sparse Regressions
###   (Poisson Response)
### Aliases: msaenet.sim.poisson

### ** Examples

dat <- msaenet.sim.poisson(
  n = 300, p = 500, rho = 0.6,
  coef = rep(1, 10), snr = 3, p.train = 0.7,
  seed = 1001
)

dim(dat$x.tr)
dim(dat$x.te)



