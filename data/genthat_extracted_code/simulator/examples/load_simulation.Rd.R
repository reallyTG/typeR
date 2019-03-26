library(simulator)


### Name: load_simulation
### Title: Load a simulation object
### Aliases: load_simulation

### ** Examples

sim <- new_simulation(name = "normal-example",
                       label = "Normal Mean Estimation",
                       dir = tempdir())
rm(sim)
sim <- load_simulation("normal-example", dir = tempdir())



