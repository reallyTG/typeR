library(R2BayesX)


### Name: term.freqs
### Title: Extract model term selection frequencies.
### Aliases: term.freqs
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 500
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3), z = runif(n, -1, 1),
##D    w = runif(n, 0, 1), fac = factor(rep(1:10, n/10)))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x) + sx(z) + sx(w) + sx(fac, bs = "re"),
##D    method = "STEP", CI = "MCMCbootstrap", bootstrapsamples = 99,
##D    data = dat)
##D summary(b)
##D 
##D ## extract frequency tables
##D term.freqs(b)
## End(Not run)



