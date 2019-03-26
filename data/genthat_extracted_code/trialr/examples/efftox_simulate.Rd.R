library(trialr)


### Name: efftox_simulate
### Title: Run EffTox simulations
### Aliases: efftox_simulate

### ** Examples

dat <- efftox_parameters_demo()
set.seed(123)
# Let's say we want to use only 2 chains. Extra args are passed to stan
## Not run: 
##D sims <- efftox_simulate(dat, num_sims = 10, first_dose = 1,
##D                         true_eff = c(0.20, 0.40, 0.60, 0.80, 0.90),
##D                         true_tox = c(0.05, 0.10, 0.15, 0.20, 0.40),
##D                         cohort_sizes = rep(3, 13),
##D                         chains = 2)
##D table(sims$recommended_dose) / length(sims$recommended_dose)
##D table(unlist(sims$doses_given)) / length(unlist(sims$doses_given))
##D table(unlist(sims$doses_given)) / length(sims$recommended_dose)
## End(Not run)
# In real life, we would run thousands of iterations, not 10.
# This is an example.



