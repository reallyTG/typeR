library(BBMV)


### Name: lnL_FPK
### Title: Creation of the likelihood function
### Aliases: lnL_FPK lnL_BBMV

### ** Examples

## Not run: 
##D # Simulate data: tree + continuous trait
##D library(geiger)
##D tree=sim.bdtree(stop='taxa',n=10) # tree with few tips for quick tests
##D tree$edge.length=100*tree$edge.length/max(branching.times(tree)) # rescale the tree 
##D # Simulate trait evolving on a macroevolutionary landscape with two peaks of equal heights
##D x=seq(from=-1.5,to=1.5,length.out=100)
##D bounds=c(min(x),max(x)) # the bounds we use for simulating
##D V6=10*(x^4-0.5*(x^2)+0.*x) # this is the evolutionary potential: it has two wells
##D TRAIT= Sim_FPK(tree,x0=0,V=V6,sigma=10,bounds=c(-5, 5)) 
##D # create a likelihood function for the FPK model: 
##D ll_FPK4=lnL_FPK(tree,TRAIT,Npts=25,a=NULL,b=NULL,c=NULL) # the full model
## End(Not run)



