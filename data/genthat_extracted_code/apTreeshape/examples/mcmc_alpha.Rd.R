library(apTreeshape)


### Name: mcmc_alpha
### Title: Inference of the alpha parameter
### Aliases: mcmc_alpha

### ** Examples

ntip=30
set.seed(123)
tree=simulate_tree(epsilon = 0.01,alpha = -1,beta = 0,N = ntip,equal.ab = TRUE)
beta=maxlik.betasplit(tree,up=10)$max_lik
plot(tree)
  
niter=1000

## Not run: 
##D chain=mcmc_alpha(tree,epsilon=0.01,beta=beta,niter=600,V = c(0.1),ini=c(0),
##D                  verbose = 100,silent = FALSE,Nadapt = 100,NadaptMin = 100)
##D   
##D # Continue the same chain
##D chain=mcmc_alpha(tree,epsilon=0.01,beta=beta,niter=400,verbose = 100,silent = FALSE,
##D                  chain = chain,Nadapt = 100,NadaptMin = 500,NadaptMax = 700)
##D   
##D thinned=mcmc(chain$mcmc[seq(200,1000,10),])
##D plot(thinned)
##D da=density(thinned[,"alpha"])
##D MPa=da$x[which.max(da$y)]
##D print(MPa)
##D 
## End(Not run)




