library(nimble)


### Name: samplerAssignmentRules-class
### Title: Class 'samplerAssignmentRules'
### Aliases: addRule printRules reorder samplerAssignmentRules
###   samplerAssignmentRules-class

### ** Examples

## Not run: 
##D ## enable the use of samplerAssignmentRules:
##D nimbleOptions(MCMCuseSamplerAssignmentRules = TRUE)
##D 
##D ## omitting empty=TRUE creates a copy of nimble's default rules
##D my_rules <- samplerAssignmentRules(empty = TRUE)
##D 
##D my_rules$addRule(quote(model$isEndNode(node)), "posterior_predictive")
##D my_rules$addRule(quote(model$isDiscrete(node)), "my_new_discrete_sampler")
##D my_rules$addRule(TRUE, "RW")   ## default catch-all sampler assignment
##D 
##D ## print the ordered set of sampler assignment rules
##D my_rules$printRules()
##D 
##D ## assign samplers according to my_rules object
##D conf <- configureMCMC(Rmodel, rules = my_rules)
##D conf$printSamplers()
##D 
##D ## view the current (default) assignment rules used by configureMCMC()
##D nimbleOptions(MCMCdefaultSamplerAssignmentRules)
##D 
##D ## change default behaviour of configureMCMC() to use my_rules
##D nimbleOptions(MCMCdefaultSamplerAssignmentRules = my_rules)
##D 
##D ## reset configureMCMC() to use default rules
##D nimbleOptions(MCMCdefaultSamplerAssignmentRules = samplerAssignmentRules())
## End(Not run)



