library(R2BayesX)


### Name: bayesx.control
### Title: Control Parameters for BayesX
### Aliases: bayesx.control
### Keywords: regression

### ** Examples

bayesx.control()

## Not run: 
##D set.seed(111)
##D n <- 500
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3))
##D ## response
##D dat$y <- with(dat, 10 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate models with
##D ## bayesx MCMC and REML
##D b1 <- bayesx(y ~ sx(x), method = "MCMC", data = dat)
##D b2 <- bayesx(y ~ sx(x), method = "REML", data = dat)
##D 
##D ## compare reported output
##D summary(b1)
##D summary(b2)
## End(Not run)



