library(factorstochvol)


### Name: covmat.fsvdraws
### Title: Extract posterior draws of the model-implied covariance matrix
### Aliases: covmat.fsvdraws

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(n = 500, series = 3, factors = 1) # simulate 
##D res <- fsvsample(sim$y, factors = 1, keeptime = "all") # estimate
##D covs <- covmat(res) # extract
##D 
##D # Trace plot of determinant of posterior covariance matrix
##D # at time t = n = 500:
##D detdraws <- apply(covs[,,,500], 3, det)
##D ts.plot(detdraws)
##D abline(h = mean(detdraws), col = 2)          # posterior mean
##D abline(h = median(detdraws), col = 4)        # posterior median
##D abline(h = det(covmat(sim)[,,500]), col = 3) # implied by DGP
##D 
##D # Trace plot of draws from posterior covariance of Sim1 and Sim2 at
##D # time t = n = 500:
##D ts.plot(covs[1,2,,500])
##D abline(h = covmat(sim)[1,2,500], col = 3) # "true" value
##D 
##D # Smoothed kernel density estimate:
##D plot(density(covs[1,2,,500], adjust = 2))
##D 
##D # Summary statistics:
##D summary(covs[1,2,,500])
## End(Not run)




