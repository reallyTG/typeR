library(R2BayesX)


### Name: GRstats
### Title: Compute Gelman and Rubin's convergence diagnostics from
###   multicore BayesX models.
### Aliases: GRstats
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 500
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3), z = runif(n, -3, 3),
##D    w = runif(n, 0, 6), fac = factor(rep(1:10, n/10)))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) + cos(z) * sin(w) +
##D    c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac] + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x) + sx(z, w, bs = "te") + fac,
##D    data = dat, method = "MCMC", chains = 3)
##D 
##D ## obtain Gelman and Rubin's convergence diagnostics
##D GRstats(b, term = c("sx(x)", "sx(z,w)"))
##D GRstats(b, term = c("linear-samples", "var-samples"))
##D 
##D ## of all parameters
##D GRstats(b, term = c("sx(x)", "sx(z,w)",
##D   "linear-samples", "var-samples"))
## End(Not run)



