library(MCMCvis)


### Name: MCMCpstr
### Title: Summarize and extract posterior chains from MCMC output while
###   preserving parameter structure
### Aliases: MCMCpstr

### ** Examples

#Load data
data(MCMC_data)

MCMCpstr(MCMC_data, func = function(x) quantile(x, probs = c(0.01, 0.99)))




