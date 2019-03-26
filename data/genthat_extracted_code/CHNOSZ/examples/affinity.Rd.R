library(CHNOSZ)


### Name: affinity
### Title: Chemical Affinities of Formation Reactions
### Aliases: affinity

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)## set up a system and calculate
## chemical affinities of formation reactions
basis(c("SiO2", "MgO", "H2O", "O2"), c(-5, -5, 0, 999))
species(c("quartz","enstatite","forsterite"))
# chemical affinities (A/2.303RT) at 25 deg C and 1 bar
affinity()
# at higher temperature and pressure
affinity(T=500, P=2000)
# at 25 temperatures and pressures
affinity(T=c(500, 1000, 5), P=c(1000, 5000, 5))
# equilibrium constants of formation reactions
affinity(property="logK")
# standard molal Gibbs energies of species,
# user units (default: cal/mol)
affinity(property="G.species")
# standard molal Gibbs energies of reactions
affinity(property="G")
# a T,P-transect
# (fluid pressure from Helgeson et al., 2009 Fig. 7)
affinity(T=c(25, 110, 115, 215), P=c(11, 335, 500, 1450))



