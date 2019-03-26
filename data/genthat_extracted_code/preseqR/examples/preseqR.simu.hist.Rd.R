library(preseqR)


### Name: preseqR.simu.hist
### Title: Simulation
### Aliases: preseqR.simu.hist
### Keywords: simulation, sampling, mixture of Poisson

### ** Examples

## load library
library(preseqR)
## construct a RNG
f <- function(n) {
  rgamma(n, shape=0.5, scale=1)
}
## sample 10,000 individuals
preseqR.simu.hist(L=1e5, N=10000, f)



