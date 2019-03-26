library(np)


### Name: npquantile
### Title: Kernel Univariate Quantile Estimation
### Aliases: npquantile
### Keywords: nonparametric

### ** Examples

## Not run: 
##D ## Simulate data from a chi-square distribution
##D df <- 50
##D x <- rchisq(100,df=df)
##D 
##D ## Vector of quantiles desired
##D tau <- c(0.01,0.05,0.25,0.50,0.75,0.95,0.99)
##D 
##D ## Compute kernel smoothed sample quantiles
##D npquantile(x,tau)
##D 
##D ## Compute sample quantiles using the default method in R (Type 7)
##D quantile(x,tau)
##D 
##D ## True quantiles based on known distribution
##D qchisq(tau,df=df)
## End(Not run) 



