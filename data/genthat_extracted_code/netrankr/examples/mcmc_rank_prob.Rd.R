library(netrankr)


### Name: mcmc_rank_prob
### Title: Estimate rank probabilities with Markov Chains
### Aliases: mcmc_rank_prob

### ** Examples

## Not run: 
##D data("florentine_m")
##D P <- neighborhood_inclusion(florentine_m)
##D res <- exact_rank_prob(P)
##D mcmc <- mcmc_rank_prob(P,rp = vcount(g)^3)
##D 
##D # mean absolute error (expected ranks)
##D mean(abs(res$expected.rank-mcmc$expected.rank))
## End(Not run)



