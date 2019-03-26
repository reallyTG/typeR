library(CausalFX)


### Name: wpp
### Title: The Witness Protection Program for Causal Effect Estimation
### Aliases: wpp

### ** Examples

## Generate a synthetic problem
problem <- simulateWitnessModel(p = 4, q = 4, par_max = 3, M = 200)

## Calculate true effect for evaluation purposes
sol_pop <- covsearch(problem, pop_solve = TRUE)
effect_pop <- synthetizeCausalEffect(problem)
cat(sprintf("ACE (true) = %1.2f\n", effect_pop$effect_real))

## WPP search (with a small number of Monte Carlo samples)
epsilons <- c(0.2, 0.2, 0.2, 0.2, 0.95, 1.05)
sol_wpp <- wpp(problem, epsilons, M = 100)
summary(sol_wpp)



