library(simulator)


### Name: tabulate_eval
### Title: Make a table of a metric for each pair of models and methods
### Aliases: tabulate_eval

### ** Examples

## Not run: 
##D  # suppose previously we had run the following:
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model,
##D                   n = list(10, 20, 30),
##D                   vary_along = "n") %>%
##D    simulate_from_model(nsim = 50, index = 1:3) %>%
##D    run_method(my_example_method) %>%
##D    evaluate(my_example_loss)
##D    # then we could plot this
##D    tabulate_eval(sim, "myloss")
##D  
## End(Not run)



