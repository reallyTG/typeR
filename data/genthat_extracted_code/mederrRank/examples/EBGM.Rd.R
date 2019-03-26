library(mederrRank)


### Name: EBGM
### Title: Geometric Mean of the Relative Risk Empirical Bayes Posterior
###   Distribution
### Aliases: EBGM
### Keywords: Empirical Bayes Medication Errors Optimal Bayesian Ranking
###   ranking

### ** Examples

## Not run: 
##D data("simdata", package = "mederrRank")
##D summary(simdata)
##D 
##D fit <- bhm.mcmc(simdata, nsim = 1000, burnin = 500, scale.factor = 1.1)
##D resamp <- bhm.resample(fit, simdata, p.resample = .1,
##D 	k = c(3, 6, 10, 30, 60, Inf), eta = c(.5, .8, 1, 1.25, 2))
##D fit2 <- bhm.constr.resamp(fit, resamp, k = 3, eta = .8)
##D 
##D theta0 <- c(10, 6, 100, 100, .1)
##D ans <- mixnegbinom.em(simdata, theta0, 50000, 0.01,
##D 	se = FALSE, stratified = TRUE)
##D 
##D ni <- simdata@numi
##D rank(EBGM(ans)[1:ni])
##D summary(fit2, ans, simdata)
## End(Not run)



