library(pauwels2014)


### Name: simulate_experiment_no_transform
### Title: Link to the ode solver.
### Aliases: simulate_experiment_no_transform
### Keywords: Simulation functions

### ** Examples

## Generate the knowledge object with correct parameter value
knobj <- generate_our_knowledge(transform_params)

temp <- simulate_experiment_no_transform(knobj$global_parameters$true_params, 
 knobj$global_parameters$initial_conditions, knobj)

head(temp)



