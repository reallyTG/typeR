library(pauwels2014)


### Name: log_likelihood
### Title: User defined likelihood function.
### Aliases: log_likelihood
### Keywords: Model specific functions

### ** Examples

data(experiment_list1)
data(observables)

## Generate the knowledge object with correct parameter value
knobj <- generate_our_knowledge(transform_params)

simu <- simulate_experiment(knobj$global_parameters$true_params_T, knobj, experiment_list1$nothing)

simu_subset <- simu[
 knobj$global_parameters$tspan %in% observables[["mrnaLow"]]$reso, 
 observables[["mrnaLow"]]$obs
]

data <- add_noise(simu_subset)

log_likelihood(simu, simu_subset, data) 




