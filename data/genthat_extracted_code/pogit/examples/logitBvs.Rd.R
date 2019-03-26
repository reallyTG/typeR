library(pogit)


### Name: logitBvs
### Title: Bayesian variable selection for the binomial logit model
### Aliases: logitBvs
### Keywords: models

### ** Examples

## Not run: 
##D ## Examples below should take about 1-2 minutes.
##D 
##D # load simulated data set 'simul_binomial'
##D data(simul_binomial)
##D y <- simul_binomial$y
##D N <- simul_binomial$N
##D X <- as.matrix(simul_binomial[, -c(1, 2)])
##D 
##D # Bayesian variable selection for simulated data set
##D m1 <- logitBvs(y = y, N = N, X = X)
##D 
##D # print, summarize and plot results
##D print(m1)
##D summary(m1)
##D plot(m1)
##D 
##D # MCMC sampling without BVS with specific MCMC and prior settings
##D m2 <- logitBvs(y = y, N = N, X = X, prior = list(slab = "Normal"), 
##D                mcmc = list(M = 4000, burnin = 1000, thin = 5),
##D                BVS = FALSE)
##D print(m2)    
##D summary(m2)
##D plot(m2, maxPlots = 4) 
##D 
##D # BVS with specification of regression effects subject to selection
##D m3 <- logitBvs(y = y, N = N, X = X, mcmc = list(M = 4000, burnin = 1000), 
##D                model = list(deltafix = c(1, 1, 1, 0, 0, 0, 1, 0, 0)))   
##D print(m3)   
##D summary(m3)
##D plot(m3, burnin = FALSE, maxPlots = 4)
##D plot(m3, type = "acf", maxPlots = 4)       
## End(Not run)



