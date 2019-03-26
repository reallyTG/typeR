library(BBMV)


### Name: Uncertainty_FPK
### Title: Parameter uncertainty
### Aliases: Uncertainty_FPK

### ** Examples

## Not run: 
##D # Simulate data: tree + continuous trait
##D library(geiger)
##D tree=sim.bdtree(stop='taxa',n=10) # tree with few tips for quick tests
##D tree$edge.length=100*tree$edge.length/max(branching.times(tree)) # rescale the tree 
##D # Simulate trait evolving on a macroevolutionary landscape with two peaks of equal heights
##D x=seq(from=-1.5,to=1.5,length.out=100)
##D bounds=c(min(x),max(x)) # the bounds we use for simulating: for technical purposes only
##D V6=10*(x^4-0.5*(x^2)+0.*x) # this is the evolutionary potential: it has two wells
##D TRAIT= Sim_FPK(tree,x0=0,V=V6,sigma=10,bounds=c(-5, 5)) 
##D # fit the FPK model: 
##D ll_FPK4=lnL_FPK(tree,TRAIT,Npts=25,a=NULL,b=NULL,c=NULL) # the full model
##D fit4=find.mle_FPK(model=ll_FPK4)
##D # Measure uncertainty on model parameters
##D Uncertainty_FPK(fit=fit4,tree,trait=TRAIT,Npts=25,effort_uncertainty= 100,
##D   scope_a=c(-1,10),scope_b=c(-5,5),scope_c=c(-2,2))
## End(Not run)



