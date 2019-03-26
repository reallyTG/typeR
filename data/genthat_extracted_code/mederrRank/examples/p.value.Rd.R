library(mederrRank)


### Name: p.value
### Title: Posterior Predictive Test statistics
### Aliases: p.value
### Keywords: Medication Errors Optimal Bayesian Ranking ranking ranks

### ** Examples

## Not run: 
##D data("simdata", package = "mederrRank")
##D summary(simdata)
##D 
##D fit <- bhm.mcmc(simdata, nsim = 1000, burnin = 500, scale.factor = 1.1)
##D resamp <- bhm.resample(fit, simdata, p.resample = .1,
##D 	k = c(3, 6, 10, 30, 60, Inf), eta = c(.5, .8, 1, 1.25, 2))
##D fit2 <- bhm.constr.resamp(fit, resamp, k = 3, eta = .8)
##D reps <- post.rep(fit2, simdata)
##D pvalues <- p.value(reps)
## End(Not run)



