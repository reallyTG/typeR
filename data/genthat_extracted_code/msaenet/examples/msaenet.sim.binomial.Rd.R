library(msaenet)


### Name: msaenet.sim.binomial
### Title: Generate Simulation Data for Benchmarking Sparse Regressions
###   (Binomial Response)
### Aliases: msaenet.sim.binomial

### ** Examples

dat <- msaenet.sim.binomial(
  n = 300, p = 500, rho = 0.6,
  coef = rep(1, 10), snr = 3, p.train = 0.7,
  seed = 1001
)

dim(dat$x.tr)
dim(dat$x.te)
table(dat$y.tr)
table(dat$y.te)



