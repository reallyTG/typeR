library(surveillance)


### Name: siaf.simulatePC
### Title: Simulation from an Isotropic Spatial Kernel via Polar
###   Coordinates
### Aliases: siaf.simulatePC
### Keywords: internal

### ** Examples

simfun <- siaf.powerlaw()$simulate
## is internally generated as siaf.simulatePC(intrfr.powerlaw)

set.seed(1)
simfun(n=10, siafpars=log(c(sigma=1, d=2)), ub=5)



