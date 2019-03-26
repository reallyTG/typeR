library(BayesLCA)


### Name: as.mcmc.blca.gibbs
### Title: Converts 'blca.gibbs' Objects to type 'mcmc'
### Aliases: as.mcmc.blca.gibbs blca2mcmc
### Keywords: blca as.mcmc

### ** Examples

data(Alzheimer)

## Not run:  fit.gibbs <- blca.gibbs(Alzheimer, 2) 
## Not run:  raftery.diag(as.mcmc(fit.gibbs)) 

## Not run:  fit.gibbs <- blca.gibbs(Alzheimer, 2, K=100000, accept=0.1, burn.in=100) 
## Not run:  plot(as.mcmc(fit.gibbs)) 




