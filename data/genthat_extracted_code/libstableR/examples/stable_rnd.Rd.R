library(libstableR)


### Name: stable_rnd
### Title: Skew stable distribution random sample generation.
### Aliases: stable_rnd
### Keywords: distribution

### ** Examples

N <- 1000
pars <- c(1.25, 0.95, 1.0, 0.0)
rnd <- stable_rnd(N, pars)

hist(rnd)



