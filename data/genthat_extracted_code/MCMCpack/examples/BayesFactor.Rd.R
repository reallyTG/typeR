library(MCMCpack)


### Name: BayesFactor
### Title: Create an object of class BayesFactor from MCMCpack output
### Aliases: BayesFactor is.BayesFactor is.BayesFactor
### Keywords: models

### ** Examples


## Not run: 
##D data(birthwt)
##D 
##D model1 <- MCMCregress(bwt~age+lwt+as.factor(race) + smoke + ht,
##D                      data=birthwt, b0=c(2700, 0, 0, -500, -500,
##D                                         -500, -500),
##D                      B0=c(1e-6, .01, .01, 1.6e-5, 1.6e-5, 1.6e-5,
##D                           1.6e-5), c0=10, d0=4500000,
##D                      marginal.likelihood="Chib95", mcmc=10000)
##D 
##D model2 <- MCMCregress(bwt~age+lwt+as.factor(race) + smoke,
##D                      data=birthwt, b0=c(2700, 0, 0, -500, -500,
##D                                         -500),
##D                      B0=c(1e-6, .01, .01, 1.6e-5, 1.6e-5, 1.6e-5),
##D                      c0=10, d0=4500000,
##D                      marginal.likelihood="Chib95", mcmc=10000)
##D 
##D model3 <- MCMCregress(bwt~as.factor(race) + smoke + ht,
##D                      data=birthwt, b0=c(2700, -500, -500,
##D                                         -500, -500),
##D                      B0=c(1e-6, 1.6e-5, 1.6e-5, 1.6e-5,
##D                           1.6e-5), c0=10, d0=4500000,
##D                      marginal.likelihood="Chib95", mcmc=10000)
##D 
##D BF <- BayesFactor(model1, model2, model3)
##D print(BF)
##D 
## End(Not run)




