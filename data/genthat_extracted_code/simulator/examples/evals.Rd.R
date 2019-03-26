library(simulator)


### Name: evals
### Title: Get one or more evals from a simulation
### Aliases: evals

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
##D  # then we could get the metric evaluated on the method's output:
##D  e <- evals(sim)
##D  # we can export it as a data.frame
##D  as.data.frame(e)
##D  # or we can get at a particular draw-method-metric triplet
##D  e@evals$`my-method`$r1.1$myloss
##D  
## End(Not run)



