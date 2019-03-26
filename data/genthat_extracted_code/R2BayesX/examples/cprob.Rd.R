library(R2BayesX)


### Name: cprob
### Title: Extract Contour Probabilities
### Aliases: cprob
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 500
##D 
##D ## regressor
##D dat <- data.frame(x = runif(n, -3, 3))
##D 
##D ## response 
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D ## need to set the contourprob option, 
##D ## otherwise BayesX will not calculate probabilities
##D ## see also the reference manual of BayesX available
##D ## at www.BayesX.org
##D b <- bayesx(y ~ sx(x, bs = "ps", contourprob = 4), data = dat)
##D 
##D ## extract contour probabilities
##D cprob(b, term = "sx(x)")
## End(Not run)



