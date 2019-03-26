library(pauwels2014)


### Name: simulate_experiment
### Title: Simulates the dynamics of a molecular perturbation
### Aliases: simulate_experiment
### Keywords: Simulation functions

### ** Examples

data(experiment_list1)

## Generate the knowledge object with correct parameter value
knobj <- generate_our_knowledge(transform_params)

temp <- simulate_experiment(knobj$global_parameters$true_params, 
 knobj, experiment_list1$nothing)

head(temp)



