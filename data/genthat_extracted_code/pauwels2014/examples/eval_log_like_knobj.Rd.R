library(pauwels2014)


### Name: eval_log_like_knobj
### Title: Posterior function.
### Aliases: eval_log_like_knobj
### Keywords: Simulation functions

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

eval_log_like_knobj(knobj$global_parameters$true_params_T, knobj)




