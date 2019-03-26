library(coala)


### Name: create_abc_param
### Title: Convert Simulation Results to abc's Parameter Format
### Aliases: create_abc_param

### ** Examples

model <- coal_model(10, 1) +
  feat_mutation(par_prior("theta", rnorm(1, 5, .5))) +
  sumstat_sfs()
sim_results <- simulate(model, nsim = 2)
abc_param <- create_abc_param(sim_results, model)
print(abc_param)



