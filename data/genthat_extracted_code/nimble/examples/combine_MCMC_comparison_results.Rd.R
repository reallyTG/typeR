library(nimble)


### Name: combine_MCMC_comparison_results
### Title: Combine multiple objects returned by compareMCMCs
### Aliases: combine_MCMC_comparison_results

### ** Examples

## Not run: 
##D nimbleMCMCresults <- compareMCMCs(
##D  modelInfo = list(
##D    code = code,
##D    data = data,
##D    constants = constants,
##D    inits = inits),
##D  MCMCs = c('nimble', 'nimble_slice'),
##D  summary = TRUE
##D )
##D 
##D jagsMCMCresults <- compareMCMCs(
##D  modelInfo = list(
##D    code = code,
##D    data = data,
##D    constants = constants,
##D    inits = inits),
##D  MCMCs = c('jags'),
##D  summary = TRUE
##D )
##D 
##D combinedMCMCresults <- combine_MCMC_comparison_results(nimbleMCMCresults[['model1']],
##D                                                        jagsMCMCresults[['model1']],
##D                                                        name = 'combinedMCMCresults')
## End(Not run)




