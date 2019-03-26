library(IMIFA)


### Name: show_IMIFA_digit
### Title: Plot the posterior mean image
### Aliases: show_IMIFA_digit
### Keywords: plotting

### ** Examples

## Not run: 
##D # Load the USPS data and discard peripheral digits
##D data(USPSdigits)
##D ylab  <- USPSdigits$train[,1]
##D train <- USPSdigits$train[,-1]
##D ind   <- apply(train, 2, sd) > 0.7
##D dat   <- train[,ind]
##D 
##D # Fit an IMIFA model (warning: quite slow!)
##D # sim <- mcmc_IMIFA(dat, n.iters=100, prec.mu=1e-03, z.init="kmeans",
##D                     centering=FALSE, scaling="none")
##D # res <- get_IMIFA_results(sim, zlabels=ylab)
##D 
##D # Examine the posterior mean image of the first two clusters
##D show_IMIFA_digit(res, dat=train, ind=ind)
##D show_IMIFA_digit(res, dat=train, ind=ind, G=2)
## End(Not run)



