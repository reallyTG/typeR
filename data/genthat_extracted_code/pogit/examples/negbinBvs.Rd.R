library(pogit)


### Name: negbinBvs
### Title: Bayesian variable selection for the negative binomial model
### Aliases: negbinBvs
### Keywords: models

### ** Examples

## Not run: 
##D ## Examples below should take about 1-2 minutes.
##D 
##D ## ------ (use simul_pois1) ------
##D data(simul_pois1)
##D y <- simul_pois1$y
##D X <- as.matrix(simul_pois1[, -1])
##D 
##D # Bayesian variable selection for simulated data set
##D m1 <- negbinBvs(y = y, X = X)
##D 
##D # print results (check acceptance rate for 'rho')
##D print(m1)
##D 
##D # re-run with adapted tuning parameter 'eps'
##D m2 <- negbinBvs(y = y, X = X, prior = list(eps = 0.4)) 
##D 
##D # print and summarize results
##D print(m2)
##D summary(m2)
##D 
##D # alternatively, compare results to overdispersed Poisson model with 
##D # normal random intercept (subject to selection), provided in 'poissonBvs' 
##D 
##D # specify observation-specific random intercept
##D cID <- seq_along(y)
##D m3  <- poissonBvs(y = y, X = X, model = list(ri = TRUE, clusterID = cID))
##D 
##D # print, summarize and plot results
##D print(m3)
##D summary(m3) 
##D # note that thetaB is not selected (!)
##D 
##D plot(m3, burnin = FALSE, thin = FALSE)
##D 
##D 
##D ## ------ (use data set "azdrg112" from package "COUNT") ------
##D 
##D if (!requireNamespace("COUNT", quietly = TRUE)){
##D  stop("package 'COUNT' is needed for this example to work. 
##D        Please install it.")
##D }
##D 
##D library(COUNT)
##D # load data set 'azdrg112' 
##D # (Arizona Medicare data for DRG (Diagnostic Related Group) 112)
##D data(azdrg112) 
##D 
##D y <- as.numeric(azdrg112$los) # hospital length of stay: 1-53 days
##D X <- as.matrix(azdrg112[,-1]) # covariates (gender, type1, age75)
##D m4 <- negbinBvs(y = y, X = X, mcmc = list(M = 4000))  
##D 
##D # print results (check acceptance rate for 'rho')
##D print(m4)
##D summary(m4)
##D plot(m4, burnin = FALSE)
##D 
##D # adapte tuning parameter eps (and set BVS to FALSE)
##D prior <- list(eps = 0.1)
##D m5 <- negbinBvs(y = y, X = X, mcmc = list(M = 4000), prior = prior, 
##D                 BVS = FALSE)  
##D 
##D # print, summarize and plot results
##D print(m5)
##D summary(m5)
##D plot(m5, burnin = FALSE, thin = FALSE)
##D plot(m5, type = "acf", lag.max = 50)
## End(Not run)



