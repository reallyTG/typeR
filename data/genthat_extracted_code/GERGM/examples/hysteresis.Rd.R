library(GERGM)


### Name: hysteresis
### Title: A function to automatically generate hysteresis plots for all
###   structural parameter estimates.
### Aliases: hysteresis

### ** Examples

## Not run: 
##D set.seed(12345)
##D net <- matrix(rnorm(100,0,20),10,10)
##D colnames(net) <- rownames(net) <- letters[1:10]
##D formula <- net ~  mutual + ttriads
##D 
##D test <- gergm(formula,
##D               normalization_type = "division",
##D               network_is_directed = TRUE,
##D               use_MPLE_only = FALSE,
##D               estimation_method = "Metropolis",
##D               number_of_networks_to_simulate = 40000,
##D               thin = 1/10,
##D               proposal_variance = 0.5,
##D               downweight_statistics_together = TRUE,
##D               MCMC_burnin = 10000,
##D               seed = 456,
##D               convergence_tolerance = 0.01,
##D               MPLE_gain_factor = 0,
##D               force_x_theta_updates = 4)
##D 
##D hysteresis_results <- hysteresis(
##D     test,
##D     networks_to_simulate = 1000,
##D     burnin = 500,
##D     range = 2,
##D     steps = 20,
##D     simulation_method = "Metropolis",
##D     proposal_variance = 0.5)
## End(Not run)



