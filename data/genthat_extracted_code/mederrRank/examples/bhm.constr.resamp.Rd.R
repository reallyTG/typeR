library(mederrRank)


### Name: bhm.constr.resamp
### Title: Markov Chain Monte Carlo Estimation (Step 2) of the Bayesian
###   Hierarchical Model for Identifying the Most Harmful Medication Errors
### Aliases: bhm.constr.resamp
### Keywords: Bayesian Hierarchical Model Markov Chain Monte Carlo
###   Medication Errors Optimal Bayesian Ranking ranking

### ** Examples

## Not run: 
##D data("simdata", package = "mederrRank")
##D summary(simdata)
##D 
##D fit <- bhm.mcmc(simdata, nsim = 1000, burnin = 500, scale.factor = 1.1)
##D resamp <- bhm.resample(fit, simdata, p.resample = .1,
##D 	k = c(3, 6, 10, 30, 60, Inf), eta = c(.5, .8, 1, 1.25, 2))
##D fit2 <- bhm.constr.resamp(fit, resamp, k = 3, eta = .8)
##D plot(fit, fit2, simdata)
##D 
##D theta0 <- c(10, 6, 100, 100, .1)
##D ans <- mixnegbinom.em(simdata, theta0, 50000, 0.01, se = TRUE,
##D 	stratified = TRUE)
##D 
##D summary(fit2, ans, simdata)
## End(Not run)



