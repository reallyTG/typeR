library(xoi)


### Name: est.coi.um
### Title: Estimate the coincidence as a function of micron distance
### Aliases: est.coi.um
### Keywords: models

### ** Examples

# simple example using data simulated with no crossover interference
ncells <- 1000
L <- 2                      # chr lengths in Morgans (constant here)
nchi <- rpois(ncells, 2*L)  # number of chiasmata
xoloc <- lapply(nchi, function(a) runif(a, 0, L)) # chi locations
coi <- est.coi.um(xoloc, rep(L, ncells))

# plot estimated coincidence and intensity
#    (intensity is after scaling chromosome to length 1)
par(mfrow=c(2,1), las=1)
plot(coi$coincidence, type="l", lwd=2, ylim=c(0, max(coi$coincidence[,2])))
plot(coi$intensity, type="l", lwd=2, ylim=c(0, max(coi$intensity[,2])))




