library(coala)


### Name: feat_selection
### Title: Feature: Selection
### Aliases: feat_selection

### ** Examples

# Positive additive selection in population 2:
model <- coal_model(c(10, 13), 1, 10000) +
  feat_pop_merge(.5, 2, 1) +
  feat_selection(strength_A = 1000,
                 population = 2,
                 time = par_named("tau")) +
  feat_mutation(100) +
  feat_recombination(10) +
  sumstat_tajimas_d(population = 2)
## Not run: simulate(model, pars = c(tau = 0.03))



