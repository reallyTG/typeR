library(simulator)


### Name: draws
### Title: Get one or more draws from a simulation
### Aliases: draws

### ** Examples

## Not run: 
##D  # suppose previously we had run the following:
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model, n = 20) %>%
##D    simulate_from_model(nsim = 50, index = 1:3)
##D  # then we could get the simulated draws as follows:
##D  d <- draws(sim)
##D  d@draws$r1.1 # first random draw
##D  
## End(Not run)



