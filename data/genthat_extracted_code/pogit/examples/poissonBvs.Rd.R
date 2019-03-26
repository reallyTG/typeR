library(pogit)


### Name: poissonBvs
### Title: Bayesian variable selection for the Poisson model
### Aliases: poissonBvs
### Keywords: models

### ** Examples

## Not run: 
##D ## Examples below should take about 1-2 minutes.
##D 
##D ## ------ (use simul_pois1) ------
##D # load simulated data set 'simul_pois1'
##D data(simul_pois1)
##D y <- simul_pois1$y
##D X <- as.matrix(simul_pois1[, -1])
##D 
##D # Bayesian variable selection for simulated data set
##D m1 <- poissonBvs(y = y, X = X)
##D 
##D # print, summarize and plot results
##D print(m1)
##D summary(m1)
##D plot(m1, maxPlots = 4)
##D plot(m1, burnin = FALSE, thin = FALSE, maxPlots = 4)
##D plot(m1, type = "acf")
##D 
##D # MCMC sampling without BVS with specific MCMC and prior settings
##D m2 <- poissonBvs(y = y, X = X, prior = list(slab = "Normal"), 
##D                  mcmc = list(M = 6000, thin = 10), BVS = FALSE)
##D print(m2)
##D summary(m2, IAT = TRUE)
##D plot(m2)
##D # show traceplots disregarding thinning
##D plot(m2, thin = FALSE)
##D 
##D # specification of an overdispersed Poisson model with observation-specific 
##D # (normal) random intercept
##D cID <- seq_along(y)
##D m3  <- poissonBvs(y = y, X = X, model = list(ri = TRUE, clusterID = cID))
##D 
##D # print, summarize and plot results
##D print(m3)
##D summary(m3) 
##D # note that variance selection of the random intercept indicates that 
##D # overdispersion is not present in the data
##D plot(m3, burnin = FALSE, thin = FALSE)
##D 
##D ## ------ (use simul_pois2) ------
##D # load simulated data set 'simul_pois2'
##D data(simul_pois2)
##D y <- simul_pois2$y
##D X <- as.matrix(simul_pois2[, -c(1,2)])
##D cID <- simul_pois2$cID
##D 
##D # BVS for a Poisson model with cluster-specific random intercept
##D m4 <- poissonBvs(y = y, X = X, model = list(ri = TRUE, clusterID = cID),
##D                  mcmc = list(M = 4000, burnin = 2000))
##D print(m4)
##D summary(m4)
##D plot(m4)
##D                                
##D # similar to m4, but without variance selection of the random intercept term
##D model <- list(gammafix = 1, ri = 1, clusterID = cID)
##D m5 <- poissonBvs(y = y, X = X, model = model, mcmc = list(M = 4000, thin = 5))
##D print(m5)       
##D summary(m5)          
##D plot(m5)
##D 
##D # MCMC sampling without BVS for clustered observations
##D m6 <- poissonBvs(y = y, X = X, model = list(ri = 1, clusterID = cID), 
##D                  BVS = FALSE)
##D print(m6)         
##D summary(m6)        
##D plot(m6, maxPlots = 4)
## End(Not run)



