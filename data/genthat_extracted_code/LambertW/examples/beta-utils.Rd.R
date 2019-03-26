library(LambertW)


### Name: beta-utils
### Title: Utilities for parameter vector beta of the input distribution
### Aliases: beta-utils beta2tau check_beta estimate_beta get_beta_names
### Keywords: math utilities

### ** Examples

# By default: delta = gamma = 0 and alpha = 1
beta2tau(c(1, 1), distname = "normal") 
## Not run: 
##D   beta2tau(c(1, 4, 1), distname = "t")
## End(Not run)
beta2tau(c(1, 4, 1), distname = "t", use.mean.variance = FALSE)
beta2tau(c(1, 4, 3), distname = "t") # no problem


## Not run: 
##D check_beta(beta = c(1, 1, -1), distname = "normal")
## End(Not run)


set.seed(124)
xx <- rnorm(100)^2
estimate_beta(xx, "exp")
estimate_beta(xx, "chisq")




