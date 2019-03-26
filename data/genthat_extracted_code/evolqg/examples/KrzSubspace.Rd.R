library(evolqg)


### Name: KrzSubspace
### Title: Krzanowski common subspaces analysis
### Aliases: KrzSubspace

### ** Examples

data(dentus)
dentus.matrices = dlply(dentus, .(species), function(x) cov(x[-5]))
KrzSubspace(dentus.matrices, k = 2)

# The method in Aguirre et al. 2014 can de implemented usign this function as follows:

#Random input data with dimensions traits x traits x populations x MCMCsamples:
cov.matrices = aperm(aaply(1:10, 1, function(x) laply(RandomMatrix(6, 40,                    
                                                      variance = runif(6,1, 10)), 
                           identity)), 
                     c(3, 4, 1, 2))
   
library(magrittr)
Hs = alply(cov.matrices, 4, function(x) alply(x, 3)) %>% llply(function(x) KrzSubspace(x, 3)$H)
avgH = Reduce("+", Hs)/length(Hs)
avgH.vec <- eigen(avgH)$vectors
MCMC.H.val = laply(Hs, function(mat) diag(t(avgH.vec) %*% mat %*% avgH.vec))

# confidence intervals for variation in shared subspace directions
library(coda)
HPDinterval(as.mcmc(MCMC.H.val))    



