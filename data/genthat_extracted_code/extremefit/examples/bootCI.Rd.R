library(extremefit)


### Name: bootCI
### Title: Pointwise confidence intervals by bootstrap
### Aliases: bootCI

### ** Examples

X <- abs(rcauchy(400))
hh <- hill.adapt(X)
probs <- probgrid(0.1, 0.999999, length = 100)
B <- 200
## Not run: 
##D  #For computing time purpose
##D   bootCI(X, weights = rep(1, length(X)), probs = probs, B = B, plot = TRUE)
##D   xgrid <- sort(sample(X, 100))
##D   bootCI(X, weights = rep(1, length(X)), xgrid = xgrid, type = "survival", B = B, plot = TRUE)
## End(Not run)




