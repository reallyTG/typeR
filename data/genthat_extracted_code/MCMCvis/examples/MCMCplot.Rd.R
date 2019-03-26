library(MCMCvis)


### Name: MCMCplot
### Title: Caterpillar plots of posterior distributions from MCMC output
### Aliases: MCMCplot

### ** Examples

#Load data
data(MCMC_data)

#Plot MCMC output
MCMCplot(MCMC_data, labels = NULL)

#Just 'beta' parameters
MCMCplot(MCMC_data, params = 'beta')

#Just 'beta[1]', 'beta[4]', and 'alpha[3]'
#'params' takes regular expressions when ISB = FALSE, square brackets must be escaped with '\\'
MCMCplot(MCMC_data, params = c('beta\\[1\\]', 'beta\\[4\\]', 'alpha\\[3\\]'), ISB = FALSE)

#Rank parameters by posterior mean
MCMCplot(MCMC_data, params = 'beta', rank = TRUE)

#Create vertical plot
MCMCplot(MCMC_data, params = 'beta', horiz = FALSE)




