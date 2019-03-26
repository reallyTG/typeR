library(mcmcr)


### Name: bind_parameters
### Title: Combine two MCMC object by parameters
### Aliases: bind_parameters bind_parameters.mcmc bind_parameters.mcmc.list
###   bind_parameters.mcmcr

### ** Examples

bind_parameters(subset(mcmcr_example, parameters = "sigma"),
  subset(mcmcr_example, parameters = "beta"))



