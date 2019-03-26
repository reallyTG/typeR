library(apTreeshape)


### Name: mcmc_eta
### Title: Inference of the alpha and eta parameters
### Aliases: mcmc_eta

### ** Examples

seed=123
set.seed(seed)
ntip=30
tree=simulate_tree(epsilon = 0.001,alpha = -1,beta = 0,N = ntip,equal.ab = FALSE,eta =1.5)
beta=maxlik.betasplit(tree,up=10)$max_lik
extinctions = rank(tree$tip.ab)
tree$tip.label = rep(".", length(tree$tip.label))
plot.phylo(tree, show.node.label=TRUE, 
            cex=order(extinctions, seq(1,(tree$Nnode+1)))/
            ((tree$Nnode+1)/6), adj=0.1)

## Not run: 
##D chain=mcmc_eta(tree,epsilon=0.001,beta=beta,V = c(0.1,0.1),niter=600,ini=c(0,1),
##D                  verbose = 100,silent = FALSE,Nadapt = 100,NadaptMin = 100)
##D # The initialisation of the mcmc is quiet long because 
##D # we begin by drawing many unsampled intervals. 
##D # When this is done it gets quicker. 
##D 
##D 
##D chain=mcmc_eta(tree,epsilon=0.001,beta=beta,niter=400,verbose = 200,silent = FALSE,
##D                  chain = chain,Nadapt = 100,NadaptMin = 100,NadaptMax = 700)
##D 
##D thinned=mcmc(chain$mcmc[seq(200,1000,10),])
##D plot(thinned)
##D da=density(thinned[,"alpha"])
##D MPa=da$x[which.max(da$y)]
##D de=density(log(thinned[,"eta"]))
##D MPe=exp(de$x[which.max(de$y)])
##D print(MPa)
##D print(MPe)
## End(Not run)





