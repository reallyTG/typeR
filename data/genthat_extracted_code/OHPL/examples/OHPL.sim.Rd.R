library(OHPL)


### Name: OHPL.sim
### Title: Generate Simulation Data for Benchmarking Sparse Regressions
###   (Gaussian Response)
### Aliases: OHPL.sim

### ** Examples

dat = OHPL.sim(
  n = 100, p = 100, rho = 0.8,
  coef = rep(1, 10), snr = 3, p.train = 0.5,
  seed = 1010)

dim(dat$x.tr)
dim(dat$x.te)



