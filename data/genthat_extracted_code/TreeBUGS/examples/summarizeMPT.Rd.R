library(TreeBUGS)


### Name: summarizeMPT
### Title: Summarize JAGS Output for Hierarchical MPT Models
### Aliases: summarizeMPT

### ** Examples

# Remove additional burnin samples and recompute MPT summary
## Not run: 
##D # start later or thin (see ?window)
##D mcmc.subsamp <- window(fittedModel$runjags$mcmc, start=3001, thin=2)
##D new.mpt.summary <- summarizeMPT(mcmc.subsamp, fittedModel$mptInfo)
##D new.mpt.summary
## End(Not run)



