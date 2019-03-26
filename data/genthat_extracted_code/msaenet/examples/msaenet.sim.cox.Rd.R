library(msaenet)


### Name: msaenet.sim.cox
### Title: Generate Simulation Data for Benchmarking Sparse Regressions
###   (Cox Model)
### Aliases: msaenet.sim.cox

### ** Examples

dat <- msaenet.sim.cox(
  n = 300, p = 500, rho = 0.6,
  coef = rep(1, 10), snr = 3, p.train = 0.7,
  seed = 1001
)

dim(dat$x.tr)
dim(dat$x.te)
dim(dat$y.tr)
dim(dat$y.te)



