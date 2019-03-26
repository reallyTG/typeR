library(simulator)


### Name: plot_eval
### Title: Make a boxplot of a metric for each method
### Aliases: plot_eval

### ** Examples

## Not run: 
##D  # suppose previously we had run the following:
##D  sim <- new_simulation(name = "normal-example",
##D                        label = "Normal Mean Estimation",
##D                        dir = tempdir()) %>%
##D    generate_model(make_my_example_model, n = 20) %>%
##D    simulate_from_model(nsim = 50, index = 1:3) %>%
##D    run_method(my_example_method) %>%
##D    evaluate(my_example_loss)
##D    # then we could plot this
##D    plot_eval(sim, "myloss") # "myloss" is my_example_loss@name
##D  
## End(Not run)



