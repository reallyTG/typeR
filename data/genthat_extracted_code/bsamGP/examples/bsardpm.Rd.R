library(bsamGP)


### Name: bsardpm
### Title: Bayesian Shape-Restricted Spectral Analysis Regression with
###   Dirichlet Process Mixture Errors
### Aliases: bsardpm
### Keywords: Dirichlet processes Gaussian processes shape-restricted
###   regression

### ** Examples

## Not run: 
##D #####################
##D # Increasing-convex #
##D #####################
##D 
##D # Simulate data
##D set.seed(1)
##D 
##D n <- 200
##D x <- runif(n)
##D e <- c(rnorm(n/2, sd = 0.5), rnorm(n/2, sd = 3))
##D y <- exp(6*x - 3) + e
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # Fit the model with default priors and mcmc parameters
##D fout <- bsardpm(y ~ fs(x), nbasis = nbasis, shape = 'IncreasingConvex')
##D 
##D # Summary
##D print(fout); summary(fout)
##D 
##D # fitted values
##D fit <- fitted(fout)
##D 
##D # Plot
##D plot(fit, ask = TRUE)
##D 
## End(Not run)



