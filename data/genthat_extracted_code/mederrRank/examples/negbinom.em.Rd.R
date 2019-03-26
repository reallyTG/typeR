library(mederrRank)


### Name: negbinom.em
### Title: Expectation-Maximization Algorithm for the Negative Binomial
###   Distribution
### Aliases: negbinom.em
### Keywords: EM Empirical Bayes Medication Errors Optimal Bayesian Ranking
###   ranking

### ** Examples

data("simdata", package = "mederrRank")
summary(simdata)

## Not run: 
##D fit <- bhm.mcmc(simdata, nsim = 1000, burnin = 500, scale.factor = 1.1)
##D resamp <- bhm.resample(fit, simdata, p.resample = .1,
##D 	k = c(3, 6, 10, 30, 60, Inf), eta = c(.5, .8, 1, 1.25, 2))
##D fit2 <- bhm.constr.resamp(fit, resamp, k = 3, eta = .8)
##D plot(fit, fit2, simdata)
## End(Not run)

theta0 <- runif(2, 0, 5)
ans <- negbinom.em(simdata, theta0, 50000, 0.01,
	se = TRUE, stratified = TRUE)
ans$theta
ans$se

## Not run: 
##D summary(fit2, ans, simdata)
## End(Not run)



