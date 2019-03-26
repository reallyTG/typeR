library(simulator)


### Name: evaluate
### Title: Evaluate outputs of methods according to provided metrics.
### Aliases: evaluate

### ** Examples

## Not run: 
##D  # suppose previously we had run the following:
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model, n = 20) %>%
##D    simulate_from_model(nsim = 50, index = 1:3) %>%
##D    run_method(my_example_method)
##D  # then we could add
##D  sim <- evaluate(sim, my_example_loss)
##D  
## End(Not run)



