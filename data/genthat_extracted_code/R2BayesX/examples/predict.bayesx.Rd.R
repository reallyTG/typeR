library(R2BayesX)


### Name: predict.bayesx
### Title: Prediction from fitted BayesX objects
### Aliases: predict.bayesx
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(121)
##D n <- 500
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3), z = runif(n, 0, 1),
##D   w = runif(n, 0, 3))
##D 
##D ## generate response 
##D dat$y <- with(dat, 1.5 + sin(x) + z -3 * w + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x) + z + w, data = dat)
##D 
##D ## create some data for which predictions are required
##D nd <- data.frame(x = seq(2, 5, length = 100), z = 1, w = 0)
##D 
##D ## prediction model from refitting with weights
##D nd$fit <- predict(b, newdata = nd)
##D plot(fit ~ x, type = "l", data = nd)
## End(Not run)



