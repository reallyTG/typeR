library(MCMCpack)


### Name: PostProbMod
### Title: Calculate Posterior Probability of Model
### Aliases: PostProbMod
### Keywords: models

### ** Examples


## Not run: 
##D data(birthwt)
##D 
##D post1 <- MCMCregress(bwt~age+lwt+as.factor(race) + smoke + ht,
##D                      data=birthwt, b0=c(2700, 0, 0, -500, -500,
##D                                         -500, -500),
##D                      B0=c(1e-6, .01, .01, 1.6e-5, 1.6e-5, 1.6e-5,
##D                           1.6e-5), c0=10, d0=4500000,
##D                      marginal.likelihood="Chib95", mcmc=10000)
##D 
##D post2 <- MCMCregress(bwt~age+lwt+as.factor(race) + smoke,
##D                      data=birthwt, b0=c(2700, 0, 0, -500, -500,
##D                                         -500),
##D                      B0=c(1e-6, .01, .01, 1.6e-5, 1.6e-5, 1.6e-5),
##D                      c0=10, d0=4500000,
##D                      marginal.likelihood="Chib95", mcmc=10000)
##D 
##D post3 <- MCMCregress(bwt~as.factor(race) + smoke + ht,
##D                      data=birthwt, b0=c(2700, -500, -500,
##D                                         -500, -500),
##D                      B0=c(1e-6, 1.6e-5, 1.6e-5, 1.6e-5,
##D                           1.6e-5), c0=10, d0=4500000,
##D                      marginal.likelihood="Chib95", mcmc=10000)
##D 
##D BF <- BayesFactor(post1, post2, post3)
##D mod.probs <- PostProbMod(BF)
##D print(mod.probs)
## End(Not run)




