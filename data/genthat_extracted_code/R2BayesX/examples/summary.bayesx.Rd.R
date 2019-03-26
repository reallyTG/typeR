library(R2BayesX)


### Name: summary.bayesx
### Title: Bayesx Summary Statistics
### Aliases: summary.bayesx
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
##D    data = dat, method = "MCMC")
##D 
##D ## now show summary statistics
##D summary(b)
## End(Not run)



