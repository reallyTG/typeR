library(factorstochvol)


### Name: predcov
### Title: Predicts covariance matrix
### Aliases: predcov

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(series = 3, factors = 1) # simulate 
##D res <- fsvsample(sim$y, factors = 1) # estimate
##D 
##D # Predict 1, 10, and 100 days ahead:
##D predobj <- predcov(res, ahead = c(1, 10, 100))
##D 
##D # Trace plot of draws from posterior predictive distribution
##D # of the covariance of Sim1 and Sim2:
##D # (one, ten, and 100 days ahead):
##D plot.ts(predobj[1,2,,])
##D 
##D # Smoothed kernel density estimates of predicted covariance
##D # of Sim1 and Sim2:
##D plot(density(predobj[1,2,,"1"], adjust = 2))
##D lines(density(predobj[1,2,,"10"], adjust = 2), col = 2)
##D lines(density(predobj[1,2,,"100"], adjust = 2), col = 3)
## End(Not run)




