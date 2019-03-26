library(coala)


### Name: simulate.coalmodel
### Title: Simulate Data According to a Demographic Model
### Aliases: simulate.coalmodel

### ** Examples

model <- coal_model(10, 3) +
  feat_mutation(5) +
  sumstat_sfs() +
  sumstat_tajimas_d()
simulate(model, nsim = 2)

model <- coal_model(c(5,10), 20) +
  feat_pop_merge(par_range('tau', 0.01, 5), 2, 1) +
  feat_mutation(par_range('theta', 1, 10)) +
  sumstat_jsfs()
simulate(model, pars=c(tau = 1, theta = 5))



