library(raptr)


### Name: spp.plot
### Title: Plot species
### Aliases: spp.plot spp.plot.RapData spp.plot.RapUnsolved
###   spp.plot.RapSolved

### ** Examples

# load RapSolved objects
data(sim_ru, sim_rs)

# plot first species in sim_ru
spp.plot(sim_ru, species = 1)

# plot "bimodal" species in sim_rs
spp.plot(sim_rs, species = "bimodal")




