library(geoCount)


### Name: predY
### Title: Predict for Unsampled Locations
### Aliases: predY
### Keywords: MCMC

### ** Examples

## Not run: 
##D Ypred <- predY(res.m, loc, locp, X=loc, Xp=locp, k=1, 
##D                rho.family = "rhoPowerExp", Y.family = "Poisson")
##D # require(snowfall)
##D # Ypred <- predY(res.m, loc, locp, X=loc, Xp=locp, 
##D #                parallel="snowfall", n.cores = 4)
##D Ypred.avg <- rowMeans(Ypred$Y); EYpred.avg <- rowMeans(exp(Ypred$latent))
## End(Not run)



