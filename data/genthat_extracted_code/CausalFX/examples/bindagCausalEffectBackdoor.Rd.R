library(CausalFX)


### Name: bindagCausalEffectBackdoor
### Title: Estimates Average Causal Effects by Covariate Adjustment in
###   Binary Models
### Aliases: bindagCausalEffectBackdoor

### ** Examples

## Generate a synthetic problem
problem <- simulateWitnessModel(p = 4, q = 4, par_max = 3, M = 1000)

## Idealized case: suppose we know the true distribution,
## get "exact" ACE estimands for different adjustment sets
sol_pop <- covsearch(problem, pop_solve = TRUE)
effect_pop <- synthetizeCausalEffect(problem)
cat(sprintf(
  "ACE (true) = %1.2f\nACE (adjusting for all) = %1.2f\nACE (adjusting for nothing) = %1.2f\n",
   effect_pop$effect_real, effect_pop$effect_naive, effect_pop$effect_naive2))

## Perform inference and report results
covariate_hat <- covsearch(problem, cred_calc = TRUE, M = 1000)
if (length(covariate_hat$witness) > 1) {
  sol_ACE <- bindagCausalEffectBackdoor(problem, prior_table = 10, S = covariate_hat$Z[[1]])
  cat(sprintf("Estimated ACE = %1.2f\n", sol_ACE))
}



