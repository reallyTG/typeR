library(MCMCvis)


### Name: MCMCsummary
### Title: Summarize MCMC output
### Aliases: MCMCsummary

### ** Examples

#Load data
data(MCMC_data)

#Summary information for MCMC output - display 2 significant digits
MCMCsummary(MCMC_data, digits = 2)

#Just 'beta' parameters - round to 2 decimal places
MCMCsummary(MCMC_data, params = 'beta', round = 2)

#Just 'beta[1]', 'beta[4]', and 'alpha[3]'
#'params' takes regular expressions when ISB = FALSE, square brackets must be escaped with '\\'
MCMCsummary(MCMC_data, params = c('beta\\[1\\]', 'beta\\[4\\]', 'alpha\\[3\\]'), ISB = FALSE)




