library(coala)


### Name: par_zero_inflation
### Title: Zero Inflation for Parameters
### Aliases: par_zero_inflation

### ** Examples

# Simulate half of the loci with recomination and the other half without it:
model <- coal_model(4, 4) +
  feat_recombination(par_zero_inflation(par_named("rho"), .5, random = FALSE)) +
  sumstat_trees()
simulate(model, pars = c(rho = 1))

# Use a zero inflated gamma distribution:
model <- coal_model(4, 4) +
  feat_recombination(par_zero_inflation(par_variation(1, 10), .3)) +
  sumstat_trees()
simulate(model)



