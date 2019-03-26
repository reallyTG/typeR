library(coala)


### Name: create_abc_sumstat
### Title: Convert Simulation Results to abc's Summary Statistic Format
### Aliases: create_abc_sumstat

### ** Examples

# Using the SFS:
model <- coal_model(10, 1) +
  feat_mutation(par_prior("theta", rnorm(1, 5, .5))) +
  sumstat_sfs()
sim_results <- simulate(model, nsim = 2)
abc_sumstat <- create_abc_sumstat(sim_results, model)
print(abc_sumstat)

# Using the JSFS and converting it into a vector:
model <- coal_model(c(10, 10), 1) +
  feat_mutation(par_prior("theta", rnorm(1, 5, .5))) +
  feat_migration(par_prior("m", rnorm(1, .5, .1)), symmetri = TRUE) +
  sumstat_jsfs(transformation = function(jsfs) {
    c(sum(jsfs[1, ]), sum(jsfs[, 1]), sum(jsfs[-1, -1]))
  })
sim_results <- simulate(model, nsim = 2)
abc_sumstat <- create_abc_sumstat(sim_results, model)
print(abc_sumstat)



