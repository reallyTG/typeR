library(cplm)


### Name: bcplm
### Title: Bayesian Compound Poisson Linear Models
### Aliases: bcplm
### Keywords: models

### ** Examples


## Not run: 
##D 
##D # fit the FineRoot data with Bayesian models
##D # Bayesian cpglm
##D set.seed(10)
##D fit1 <- bcplm(RLD ~ factor(Zone) * factor(Stock), 
##D             data = FineRoot, tune.iter = 2000, 
##D             n.iter = 6000, n.burnin = 1000, n.thin = 5)
##D 
##D gelman.diag(fit1$sims.list)
##D # diagnostic plots                             
##D acfplot(fit1$sims.list, lag.max = 20)
##D xyplot(fit1$sims.list)                              
##D densityplot(fit1$sims.list)               
##D summary(fit1)
##D plot(fit1)
##D                           
##D 
##D # now fit the Bayesian model to an insurance loss triangle 
##D # (see Peters et al. 2009)
##D fit2 <- bcplm(increLoss ~ factor(year) + factor(lag), 
##D             data = ClaimTriangle, n.iter = 12000, 
##D             n.burnin = 2000, n.thin = 10, bound.p = c(1.1, 1.95))
##D gelman.diag(fit2$sims.list)                   
##D summary(fit2)
##D 
##D # mixed models 
##D set.seed(10)
##D fit3 <- bcplm(RLD ~ Stock * Zone + (1|Plant), 
##D             data = FineRoot, n.iter = 15000, 
##D             n.burnin = 5000, n.thin = 10)
##D gelman.diag(fit3$sims.list)                   
##D summary(fit3)
##D 
##D 
##D 
## End(Not run)




