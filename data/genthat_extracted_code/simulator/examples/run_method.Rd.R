library(simulator)


### Name: run_method
### Title: Run one or more methods on simulated data.
### Aliases: run_method

### ** Examples

## Not run: 
##D  # suppose previously we had run the following:
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model, n = 20) %>%
##D    simulate_from_model(nsim = 50, index = 1:3)
##D  # then we could add
##D  sim <- run_method(sim, my_example_method)
##D  
## End(Not run)



