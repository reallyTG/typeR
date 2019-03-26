library(pauwels2014)


### Name: sample_function_multi_mod_weight
### Title: Sample function visiting multiple modes of the posterior
### Aliases: sample_function_multi_mod_weight
### Keywords: Sampling functions

### ** Examples

data(experiment_list1)
data(observables)

## Generate the knowledge object with correct parameter value
knobj <- generate_our_knowledge(transform_params)

## Initialize with some data
knobj$datas[[1]] <- list(
 manip = experiment_list1$nothing,
 data = add_noise(
  simulate_experiment(knobj$global_parameters$true_params_T, knobj, experiment_list1$nothing)[
   knobj$global_parameters$tspan %in% observables[["mrnaLow"]]$reso, 
   observables[["mrnaLow"]]$obs
  ]
 )
)

## Decrease parameter values for the example
knobj$global_parameters$max_it <- 2
knobj$global_parameters$n_multi_mod <- 2
knobj$global_parameters$sample_burn_in <- 5
knobj$global_parameters$sample_to_keep1 <- 100
knobj$global_parameters$final_sample <- 100
knobj$global_parameters$final_sample_est <- 100


#thetas <- sample_function_multi_mod_weight(knobj)
#thetas



