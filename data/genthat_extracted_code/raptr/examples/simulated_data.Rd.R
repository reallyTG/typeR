library(raptr)


### Name: simulated_data
### Title: Simulated dataset for a conservation planning exercise
### Aliases: simulated_data sim_ru sim_rs
### Keywords: datasets

### ** Examples

# load data
data(sim_ru, sim_rs)

# plot species distributions
spp.plot(sim_ru, 1)
spp.plot(sim_ru, 2)
spp.plot(sim_ru, 3)

# plot selection frequencies
plot(sim_rs)

# plot best solution
plot(sim_rs, 0)



