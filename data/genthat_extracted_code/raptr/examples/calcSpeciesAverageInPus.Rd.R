library(raptr)


### Name: calcSpeciesAverageInPus
### Title: Calculate average value for species data in planning units
### Aliases: calcSpeciesAverageInPus
###   calcSpeciesAverageInPus.SpatialPolygons
###   calcSpeciesAverageInPus.SpatialPolygonsDataFrame

### ** Examples

# simulate data
sim_pus <- sim.pus(225L)
sim_spp <- lapply(c("uniform", "normal", "bimodal"), sim.species, n = 1,
                  res = 1, x = sim_pus)

# calculate average for 1 species
puvspr1.dat <- calcSpeciesAverageInPus(sim_pus, sim_spp[[1]])

# calculate average for multiple species
puvspr2.dat <- calcSpeciesAverageInPus(sim_pus, stack(sim_spp))




