library(SimDesign)


### Name: rHeadrick
### Title: Generate non-normal data with Headrick's (2002) method
### Aliases: rHeadrick

### ** Examples


## Not run: 
##D set.seed(1)
##D 
##D N <- 200
##D mean <- c(rep(0,4))
##D Sigma <- matrix(.49, 4, 4)
##D diag(Sigma) <- 1
##D skewness <- c(rep(1,4))
##D kurtosis <- c(rep(2,4))
##D 
##D nonnormal <- rHeadrick(N, mean, Sigma, skewness, kurtosis)
##D # cor(nonnormal)
##D # psych::describe(nonnormal)
##D 
##D #-----------
##D # compute the coefficients, then supply them back to the function to avoid
##D # extra computations
##D 
##D cfs <- rHeadrick(N, mean, Sigma, skewness, kurtosis, return_coefs = TRUE)
##D cfs
##D 
##D # compare
##D system.time(nonnormal <- rHeadrick(N, mean, Sigma, skewness, kurtosis))
##D system.time(nonnormal <- rHeadrick(N, mean, Sigma, skewness, kurtosis,
##D                                    coefs=cfs))
## End(Not run)




