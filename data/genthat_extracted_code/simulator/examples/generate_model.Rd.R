library(simulator)


### Name: generate_model
### Title: Generate a model.
### Aliases: generate_model

### ** Examples

 # initialize a new simulation
 sim <- new_simulation(name = "normal-example",
                       label = "Normal Mean Estimation",
                       dir = tempdir())
 # generate a model (and add it to the simulation)
 sim <- generate_model(sim, make_my_example_model, n = 20)
 # generate a sequence of models (and add them to the simulation)
 sim <- generate_model(sim, make_my_example_model,
                       n = list(10, 20, 30),
                       vary_along = "n")



