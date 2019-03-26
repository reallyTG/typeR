library(CHNOSZ)


### Name: equilibrate
### Title: Equilibrium Chemical Activities of Species
### Aliases: equilibrate equil.boltzmann equil.reaction

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## equilibrium in a simple system:
## ionization of carbonic acid
basis("CHNOS+")
species(c("CO2", "HCO3-", "CO3-2"))
# set unit activity of the species (0 = log10(1))
species(1:3, 0)
# calculate Astar (for unit activity)
res <- 100
Astar <- affinity(pH=c(0, 14, res))$values
# the logarithms of activity for a total activity
# of the balancing component (CO2) equal to 0.001
loga.boltz <- equil.boltzmann(Astar, c(1, 1, 1), 0.001)
# calculated another way
loga.react <- equil.reaction(Astar, c(1, 1, 1), rep(0.001, 100))
# probably close enough for most purposes
stopifnot(all.equal(loga.boltz, loga.react))
# the first ionization constant (pKa)
ipKa <- which.min(abs(loga.boltz[[1]] - loga.boltz[[2]]))
pKa.equil <- seq(0, 14, length.out=res)[ipKa]
# calculate logK directly
logK <- subcrt(c("CO2","H2O","HCO3-","H+"), c(-1, -1, 1, 1), T=25)$out$logK
# we could decrease tolerance here by increasing res
stopifnot(all.equal(pKa.equil, -logK, tolerance=1e-2))



