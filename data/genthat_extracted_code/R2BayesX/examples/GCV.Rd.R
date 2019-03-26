library(R2BayesX)


### Name: GCV
### Title: Gerneralized Cross Validation Criterion
### Aliases: GCV GCV.bayesx
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
##D b <- bayesx(y ~ sx(x), data = dat, method = "REML")
##D 
##D ## extract GCV
##D GCV(b)
## End(Not run)



