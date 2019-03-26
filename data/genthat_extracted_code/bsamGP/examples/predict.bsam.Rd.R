library(bsamGP)


### Name: predict.bsam
### Title: Predict method for a bsam object
### Aliases: predict.bsam

### ** Examples

## Not run: 
##D 
##D ##########################################
##D # Increasing Convex to Concave (S-shape) #
##D ##########################################
##D 
##D # simulate data
##D f <- function(x) 5*exp(-10*(x - 1)^4) + 5*x^2
##D 
##D set.seed(1)
##D 
##D n <- 100
##D x <- runif(n)
##D y <- f(x) + rnorm(n, sd = 1)
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # Fit the model with default priors and mcmc parameters
##D fout <- bsar(y ~ fs(x), nbasis = nbasis, shape = 'IncreasingConvex',
##D              spm.adequacy = TRUE)
##D 
##D # Prediction
##D xnew <- runif(n)
##D predict(fout, newnp = xnew)
## End(Not run)



