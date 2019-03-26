library(clogitLasso)


### Name: plot.clogitLasso
### Title: Plot coefficients from a 'clogitLasso' object
### Aliases: plot.clogitLasso

### ** Examples

## Not run: 
##D  # generate data
##D  y <- rep(c(1,0), 100)
##D  X <- matrix (rnorm(20000, 0, 1), ncol = 100) # pure noise
##D  strata <- sort(rep(1:100, 2))
##D 
##D  fitLasso <- clogitLasso(X,y,strata,log=TRUE)
##D  # plot
##D  plot(fitLasso)
## End(Not run)



