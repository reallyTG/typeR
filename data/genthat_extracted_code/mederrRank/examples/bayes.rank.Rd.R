library(mederrRank)


### Name: bayes.rank
### Title: Optimal Bayesian Ranking
### Aliases: bayes.rank
### Keywords: Medication Errors Optimal Bayesian Ranking ranking ranks

### ** Examples

## Not run: 
##D data("simdata", package = "mederrRank")
##D summary(simdata)
##D 
##D fit <- bhm.mcmc(simdata, nsim = 1000, burnin = 500, scale.factor = 1.1)
##D ranks <- bayes.rank(fit)
##D 
##D summary(ranks)
## End(Not run)



