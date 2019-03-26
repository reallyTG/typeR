library(BBMV)


### Name: reformat_multiclade_results
### Title: Format the output of a multiclade fit
### Aliases: reformat_multiclade_results

### ** Examples

## Not run: 
##D # We first create a potential that we will use to simulate trait evolution
##D # It has two peaks of very unequal heights
##D x=seq(from=-1.5,to=1.5,length.out=100)
##D bounds=c(min(x),max(x)) # the bounds we use for simulating
##D a=8 ; b=-4 ; c=1
##D V6=a*x^4+b*(x^2)+c*x
##D step_size=(max(bounds)-min(bounds))/(100-1)
##D V6_norm=exp(-V6)/sum(exp(-V6)*step_size) # the step size on the grid
##D par(mfrow=c(1,1))
##D plot(V6_norm,type='l')
##D 
##D # Now we simulate a tree and a continuous trait for 3 independent clades.
##D tree=sim.bdtree(stop='taxa',n=25)
##D tree$edge.length=100*tree$edge.length/max(branching.times(tree))
##D TRAIT= Sim_FPK(tree,x0=0.5,V=V6,sigma=1,bounds=bounds)
##D tree1=tree ; TRAIT1=TRAIT
##D 
##D tree=sim.bdtree(stop='taxa',n=25)
##D tree$edge.length=100*tree$edge.length/max(branching.times(tree))
##D TRAIT= Sim_FPK(tree,x0=0.5,V=V6,sigma=0.5,bounds=bounds) 
##D tree2=tree ; TRAIT2=TRAIT
##D 
##D tree=sim.bdtree(stop='taxa',n=25)
##D tree$edge.length=100*tree$edge.length/max(branching.times(tree))
##D TRAIT= Sim_FPK(tree,x0=0.5,V=V6,sigma=0.1,bounds=bounds) 
##D tree3=tree ; TRAIT3=TRAIT
##D rm(tree) ; rm(TRAIT)
##D 
##D TREES=list(tree1,tree2,tree3)
##D TRAITS=list(TRAIT1,TRAIT2,TRAIT3)
##D 
##D # Fit the FPK model
##D testbFPK4=lnl_FPK_multiclades_same_V_different_sig2(trees=TREES,
##D   traits=TRAITS,a=NULL,b=NULL,c=NULL,Npts=50)
##D fitbFPK4=find.mle_FPK_multiple_clades_same_V_different_sig2(model=testbFPK4,
##D   method='Nelder-Mead',init.optim=NULL)
##D fits=reformat_multiclade_results(fitbFPK4)
## End(Not run)



