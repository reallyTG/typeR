library(RxCEcolInf)


### Name: Analyze
### Title: Workhorse Function for Ecological Inference for Sets of R x C
###   Contingency Tables
### Aliases: Analyze
### Keywords: models

### ** Examples

## Not run: 
##D library(RxCEcolInf)
##D data(stlouis)
##D Tune.stlouis <- Tune("Bosley, Roberts, Ribaudo, Villa, NoVote ~ bvap, ovap",
##D                      data = stlouis,
##D                      num.iters = 10000,
##D                      num.runs = 15)
##D Chain1.stlouis <- Analyze("Bosley, Roberts, Ribaudo, Villa, 
##D                            NoVote ~ bvap, ovap",
##D                           rho.vec = Tune.stlouis$rhos,
##D                           data = stlouis,
##D                           num.iters = 1500000,
##D                           burnin = 150000,
##D                           save.every = 1500,
##D                           print_every = 15000,
##D                           debug = 1,
##D                           keepNNinternals = 100,
##D                           keepTHETAS = 100)
##D Chain2.stlouis <- Analyze("Bosley, Roberts , Ribaudo, Villa, 
##D                            NoVote ~ bvap, ovap",
##D                           rho.vec = Tune.stlouis$rhos,
##D                           data = stlouis,
##D                           num.iters = 1500000,
##D                           burnin = 150000,
##D                           save.every = 1500,
##D                           print_every = 15000,
##D                           debug = 1,
##D                           keepNNinternals = 100,
##D                           keepTHETAS = 100)
##D Chain3.stlouis <- Analyze("Bosley, Roberts , Ribaudo, Villa, 
##D                           NoVote ~ bvap, ovap",
##D                           rho.vec = Tune.stlouis$rhos,
##D                           data = stlouis,
##D                           num.iters = 1500000,
##D                           burnin = 150000,
##D                           save.every = 1500,
##D                           print_every = 15000,
##D                           debug = 1,
##D                           keepNNinternals = 100,
##D                           keepTHETAS = 100)
##D stlouis.MCMClist <- mcmc.list(Chain1.stlouis, Chain2.stlouis,
##D Chain3.stlouis)
##D names(attributes(stlouis.MCMClist))
##D summary(stlouis.MCMClist, quantiles = c(.025, .05, .5, .95, .975))
##D plot(stlouis.MCMClist)
##D geweke.diag(stlouis.MCMClist)
##D heidel.diag(stlouis.MCMClist)
##D #  Do not run gelman.diag; see warnings
##D NNs <- attr(stlouis.MCMClist, "NN.internals")
##D THETAS <- attr(stlouis.MCMClist, "THETA")
## End(Not run)



