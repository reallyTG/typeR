library(bsamGP)


### Name: predict.blm
### Title: Predict method for a blm object
### Aliases: predict.blm

### ** Examples

## Not run: 
##D 	#####################
##D 	# Simulated example #
##D 	#####################
##D 
##D 	# Simulate data
##D 	  set.seed(1)
##D 
##D 	  n <- 100
##D 	  w <- runif(n)
##D 	  y <- 3 + 2*w + rnorm(n, sd = 0.8)
##D 
##D 	  # Fit the model with default priors and mcmc parameters
##D 	  fout <- blr(y ~ w)
##D 
##D 	  # Predict
##D 	  new <- rnorm(n)
##D 	  predict(fout, newdata = new)
## End(Not run)



