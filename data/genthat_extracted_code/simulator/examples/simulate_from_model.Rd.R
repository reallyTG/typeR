library(simulator)


### Name: simulate_from_model
### Title: Simulate from a model.
### Aliases: simulate_from_model

### ** Examples

## Not run: 
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model, n = 20) %>%
##D    simulate_from_model(nsim = 50, index = 1:3,
##D      parallel = list(socket_names = 3))
##D  
## End(Not run)



