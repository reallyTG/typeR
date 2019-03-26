library(pauwels2014)


### Name: random_design
### Title: Simulates a randim design process.
### Aliases: random_design
### Keywords: Design strategies

### ** Examples

data(exps)
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
knobj$experiments <- paste("nothing", "mrnaLow")


## Decrease parameter values for the example
knobj$global_parameters$max_it <- 2
knobj$global_parameters$n_simu_weights <- 3
knobj$global_parameters$sample_burn_in <- 5
knobj$global_parameters$sample_to_keep1 <- 10
knobj$global_parameters$sample_to_keep2 <- 10
knobj$global_parameters$n_multi_mod_weight <- 2
knobj$global_parameters$final_sample <- 5
knobj$global_parameters$final_sample_design <- 5

## Run the random design (this takes quite some time)
#knobj <- random_design(knobj, sample_function_single_mod, exps, seed = 1, credits = 400)



