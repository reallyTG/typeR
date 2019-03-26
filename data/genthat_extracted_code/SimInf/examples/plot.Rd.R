library(SimInf)


### Name: plot,SimInf_model-method
### Title: Display the outcome from a simulated trajectory
### Aliases: plot,SimInf_model-method

### ** Examples

## Not run: 
##D ## Create an 'SIR' model with 100 nodes and initialise
##D ## it with 990 susceptible individuals and 10 infected
##D ## individuals in each node. Run the model over 100 days.
##D model <- SIR(u0 = data.frame(S = rep(990, 100),
##D                              I = rep(10, 100),
##D                              R = rep(0, 100)),
##D              tspan = 1:100,
##D              beta = 0.16,
##D              gamma = 0.077)
##D 
##D ## Run the model and save the result.
##D result <- run(model)
##D 
##D ## Plot the median and interquartile range of the number
##D ## of susceptible, infected and recovered individuals.
##D plot(result)
##D 
##D ## Plot the median and the middle 95% quantile range of the
##D ## number of susceptible, infected and recovered individuals.
##D plot(result, range = 0.95)
##D 
##D ## Plot the median and interquartile range of the  number
##D ## of infected individuals.
##D plot(result, compartments = "I")
##D 
##D ## Plot the number of susceptible, infected
##D ## and recovered individuals in the first
##D ## three nodes.
##D plot(result, node = 1:3, range = FALSE)
##D 
##D ## Plot the number of infected individuals in the first node.
##D plot(result, compartments = "I", node = 1, range = FALSE)
## End(Not run)



