library(CausalFX)


### Name: covsearch
### Title: Search for Causal Effect Covariate Adjustment
### Aliases: covsearch

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
summary(covariate_hat)



