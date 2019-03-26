library(BBMV)


### Name: find.mle_FPK
### Title: Maximum-likelihood estimation
### Aliases: find.mle_FPK

### ** Examples

## Not run: 
##D # Simulate data: tree + continuous trait
##D library(geiger)
##D tree=sim.bdtree(stop='taxa',n=10) # tree with few tips for quick tests
##D tree$edge.length=100*tree$edge.length/max(branching.times(tree)) # rescale the tree 
##D # Simulate trait evolving on a macroevolutionary landscape with two peaks of equal heights
##D x=seq(from=-1.5,to=1.5,length.out=100)
##D bounds=c(min(x),max(x)) # the bounds we use for simulating
##D # they are just here for technical purposes but are not reached
##D V6=10*(x^4-0.5*(x^2)+0.*x) # this is the evolutionary potential: it has two wells
##D TRAIT= Sim_FPK(tree,x0=0,V=V6,sigma=10,bounds=c(-5, 5)) 
##D # fit the FPK model: 
##D ll_FPK4=lnL_FPK(tree,TRAIT,Npts=25,a=NULL,b=NULL,c=NULL) # the full model
##D fit4=find.mle_FPK(model=ll_FPK4)
## End(Not run)



