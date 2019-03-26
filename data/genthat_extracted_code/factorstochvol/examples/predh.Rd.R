library(factorstochvol)


### Name: predh
### Title: Predicts factor and idiosyncratic log-volatilities h
### Aliases: predh

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(series = 3, factors = 1) # simulate 
##D res <- fsvsample(sim$y, factors = 1) # estimate
##D 
##D # Predict 1, 10, and 100 days ahead:
##D predobj <- predh(res, ahead = c(1, 10, 100))
##D 
##D # Trace plot of draws from posterior predictive factor log-variance
##D # (one, ten, and 100 days ahead):
##D plot.ts(predobj$factorh[1,,])
##D 
##D # Smoothed kernel density estimates of predicted volas:
##D plot(density(exp(predobj$factorh[1,,"1"]/2), adjust = 2))
##D lines(density(exp(predobj$factorh[1,,"10"]/2), adjust = 2), col = 2)
##D lines(density(exp(predobj$factorh[1,,"100"]/2), adjust = 2), col = 3)
## End(Not run)




