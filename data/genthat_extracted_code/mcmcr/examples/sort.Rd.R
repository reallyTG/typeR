library(mcmcr)


### Name: sort
### Title: Sort an MCMC Object
### Aliases: sort sort.mcmc sort.mcmc.list sort.mcmcr sort.mcmcrs

### ** Examples

parameters(mcmcr_example)
mcmcr_example <- subset(mcmcr_example, parameters = c("beta", "alpha"))
parameters(mcmcr_example)
mcmcr_example <- sort(mcmcr_example)
parameters(mcmcr_example)



