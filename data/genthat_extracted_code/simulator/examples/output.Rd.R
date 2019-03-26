library(simulator)


### Name: output
### Title: Get one or more outputs from a simulation
### Aliases: output

### ** Examples

## Not run: 
##D  # suppose previously we had run the following:
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model, n = 20) %>%
##D    simulate_from_model(nsim = 50, index = 1:3) %>%
##D    run_method(my_example_method)
##D  # then we could get the method's output as follows:
##D  o <- output(sim)
##D  o@out$r1.1 # first random draw's output
##D  
## End(Not run)



