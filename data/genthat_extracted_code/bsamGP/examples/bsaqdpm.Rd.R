library(bsamGP)


### Name: bsaqdpm
### Title: Bayesian Shape-Restricted Spectral Analysis Quantile Regression
###   with Dirichlet Process Mixture Errors
### Aliases: bsaqdpm
### Keywords: Dirichlet processes Gaussian processes shape-restricted
###   quantile regression

### ** Examples

## Not run: 
##D ######################
##D # Increasing-concave #
##D ######################
##D 
##D # Simulate data
##D set.seed(1)
##D 
##D n <- 500
##D x <- runif(n)
##D e <- c(rald(n/2, scale = 0.5, p = 0.5),
##D        rald(n/2, scale = 3, p = 0.5))
##D y <- log(1 + 10*x) + e
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # Fit the model with default priors and mcmc parameters
##D fout1 <- bsaqdpm(y ~ fs(x), p = 0.25, nbasis = nbasis,
##D                  shape = 'IncreasingConcave')
##D fout2 <- bsaqdpm(y ~ fs(x), p = 0.5, nbasis = nbasis,
##D                  shape = 'IncreasingConcave')
##D fout3 <- bsaqdpm(y ~ fs(x), p = 0.75, nbasis = nbasis,
##D                  shape = 'IncreasingConcave')
##D 
##D # fitted values
##D fit1 <- fitted(fout1)
##D fit2 <- fitted(fout2)
##D fit3 <- fitted(fout3)
##D 
##D # plots
##D plot(x, y, lwd = 2, xlab = 'x', ylab = 'y')
##D lines(fit1$xgrid, fit1$wbeta$mean[1] + fit1$fxgrid$mean, lwd=2, col=2)
##D lines(fit2$xgrid, fit2$wbeta$mean[1] + fit2$fxgrid$mean, lwd=2, col=3)
##D lines(fit3$xgrid, fit3$wbeta$mean[1] + fit3$fxgrid$mean, lwd=2, col=4)
##D legend('topleft',legend=c('1st Quartile','2nd Quartile','3rd Quartile'),
##D        lwd=2, col=2:4, lty=1)
##D 
## End(Not run)



