library(msBP)


### Name: msBP.test
### Title: Multiscale testing of group differences
### Aliases: msBP.test
### Keywords: multiscale testing

### ** Examples

set.seed(1)
y <- runif(100)
g <- c(rep(0,50), rep(1,50))
mcmc <- list(nrep = 5000, nb = 1000, ndisplay = 500)
## Not run: 
##D test.res <- msBP.test(y, 5, 1, g, mcmc=mcmc, plot.it = TRUE)
## End(Not run)



