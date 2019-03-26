library(bsamGP)


### Name: bsaq
### Title: Bayesian Shape-Restricted Spectral Analysis Quantile Regression
### Aliases: bsaq
### Keywords: Gaussian processes shape-restricted quantile regression

### ** Examples

## Don't show: 
# Simulate data
set.seed(1)

n <- 100
x <- runif(n)
y <- log(1 + 10*x) + rald(n, scale = 0.5, p = 0.5)

# MCMC parameters
mcmc <- list(nblow = 1000, smcmc = 1000, nskip = 1)

# Fit the model with default priors and mcmc parameters
fout <- bsaq(y ~ fs(x), p = 0.5, nbasis = 30, mcmc = mcmc, shape = "Free")

# fitted values
fit <- fitted(fout)

# plots
plot(fit)
## End(Don't show)

## Not run: 
##D ######################
##D # Increasing-concave #
##D ######################
##D 
##D # Simulate data
##D set.seed(1)
##D 
##D n <- 200
##D x <- runif(n)
##D y <- log(1 + 10*x) + rald(n, scale = 0.5, p = 0.5)
##D 
##D # Number of cosine basis functions
##D nbasis <- 50
##D 
##D # Fit the model with default priors and mcmc parameters
##D fout1 <- bsaq(y ~ fs(x), p = 0.25, nbasis = nbasis,
##D               shape = 'IncreasingConcave')
##D fout2 <- bsaq(y ~ fs(x), p = 0.5, nbasis = nbasis,
##D               shape = 'IncreasingConcave')
##D fout3 <- bsaq(y ~ fs(x), p = 0.75, nbasis = nbasis,
##D               shape = 'IncreasingConcave')
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
##D legend('topleft', legend = c('1st Quartile', '2nd Quartile', '3rd Quartile'),
##D        lwd = 2, col = 2:4, lty = 1)
##D 
## End(Not run)



