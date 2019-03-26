library(MCMCpack)


### Name: MCMCregress
### Title: Markov Chain Monte Carlo for Gaussian Linear Regression
### Aliases: MCMCregress
### Keywords: models

### ** Examples


## Not run: 
##D line   <- list(X = c(-2,-1,0,1,2), Y = c(1,3,3,3,5))
##D posterior  <- MCMCregress(Y~X, b0=0, B0 = 0.1,
##D 	      sigma.mu = 5, sigma.var = 25, data=line, verbose=1000)
##D plot(posterior)
##D raftery.diag(posterior)
##D summary(posterior)
## End(Not run)




