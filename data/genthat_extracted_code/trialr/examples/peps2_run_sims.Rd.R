library(trialr)


### Name: peps2_run_sims
### Title: Run simulations of BEBOP in PePS2
### Aliases: peps2_run_sims

### ** Examples

prob_eff <- c(0.167, 0.192, 0.5, 0.091, 0.156, 0.439)
prob_tox = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1)
peps2_scenario_data <- function() peps2_get_data(num_patients = 60,
                                                 prob_eff = prob_eff,
                                                 prob_tox = prob_tox,
                                                 eff_tox_or = rep(1, 6))
set.seed(123)
## Not run: 
##D sims <- peps2_run_sims(num_sims = 10, sample_data_func = peps2_scenario_data,
##D                        summarise_func = peps2_process)
##D apply(sapply(sims, function(x) x$Accept), 1, mean)  # 0.5 0.7 1.0 0.2 0.5 1.0
## End(Not run)
# Simulation suggests we are likely to approve in cohorts 3 and 6.
# In real life, we would run thousands of iterations, not 10.
# This is an example.




