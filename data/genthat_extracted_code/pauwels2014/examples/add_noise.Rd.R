library(pauwels2014)


### Name: add_noise
### Title: Noise generative process for the simulations
### Aliases: add_noise
### Keywords: Model specific functions

### ** Examples

data(experiment_list1)
data(observables)

## Generate the knowledge object with correct parameter value
knobj <- generate_our_knowledge(transform_params)

## Generate a time cours matrix
tempCourse <- simulate_experiment(
 knobj$global_parameters$true_params_T, 
 knobj, 
 experiment_list1$nothing
)[
 knobj$global_parameters$tspan %in% observables[["mrnaLow"]]$reso, 
 observables[["mrnaLow"]]$obs
]

## Add noise to the time course matrix
add_noise(tempCourse)



