library(mcmcr)


### Name: parameters
### Title: Parameter Names
### Aliases: parameters parameters<- set_parameters parameters.term
###   parameters.mcmc parameters.mcmc.list parameters.mcmcr

### ** Examples

parameters(mcmcr_example)
parameters(mcmcr_example) <- c("gamma", "theta", "tau")
parameters(mcmcr_example)
parameters(mcmcr_example, scalar_only = TRUE)
parameters(mcmcr_example, terms = TRUE)



