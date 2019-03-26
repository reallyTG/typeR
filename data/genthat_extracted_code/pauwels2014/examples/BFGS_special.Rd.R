library(pauwels2014)


### Name: BFGS_special
### Title: An implementation of BFGS method for posterior maximization.
### Aliases: BFGS_special
### Keywords: Optimization functions

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
knobj$experiments <- paste("nothing", "mrnaLow")

theta <- rep( 50, length(knobj$global_parameters$param_names) )
names(theta) <- knobj$global_parameters$param_names

## Only perform 5 iterations
knobj$global_parameters$max_it <- 5

temp <- BFGS_special(theta, knobj, eval_log_like_knobj)
temp$theta



