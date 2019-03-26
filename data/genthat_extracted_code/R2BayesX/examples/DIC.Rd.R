library(R2BayesX)


### Name: DIC
### Title: Deviance Information Criterion
### Aliases: DIC DIC.bayesx
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(121)
##D n <- 200
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3))
##D 
##D ## generate response 
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x), data = dat, method = "MCMC")
##D 
##D ## extract DIC
##D DIC(b)
## End(Not run)



