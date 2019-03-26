library(vsn)


### Name: sagmbSimulateData
### Title: Simulate data and assess vsn's parameter estimation
### Aliases: sagmbSimulateData sagmbAssess

### ** Examples

  sim <- sagmbSimulateData(nrstrata = 4)
  ny  <- vsn2(sim$y, strata = sim$strata)
  res <- sagmbAssess(exprs(ny), sim)
  res



