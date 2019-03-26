library(eRm)


### Name: sim.2pl
### Title: Simulation of 2-PL Data
### Aliases: sim.2pl
### Keywords: models

### ** Examples

#simulating 2-PL data
#500 persons, 10 items, sdlog = 0.30, randomized cutpoint
X <- sim.2pl(500, 10, discrim = 0.30)

#item and discrimination parameters from uniform distribution,
#cutpoint fixed
dpar <- runif(50, 0, 2)
ipar <- runif(50, -1.5, 1.5)
X <- sim.2pl(500, ipar, dpar, cutpoint = 0.5)



