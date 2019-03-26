library(BBMV)


### Name: MH_MCMC_FPK_multiclades
### Title: MCMC estimation on multiple clades
### Aliases: MH_MCMC_FPK_multiclades

### ** Examples

## Not run: 
##D x=seq(from=-1.5,to=1.5,length.out=100)
##D bounds=c(min(x),max(x)) # the bounds we use for simulating
##D a=8 ; b=-4 ; c=1
##D V6=a*x^4+b*(x^2)+c*x
##D step_size=(max(bounds)-min(bounds))/(100-1)
##D V6_norm=exp(-V6)/sum(exp(-V6)*step_size)
##D par(mfrow=c(1,1))
##D plot(V6_norm,type='l')
##D 
##D # Now we simulate a tree and a continuous trait for 3 independent clades. 
##D tree=sim.bdtree(stop='taxa',n=25) # tree with few tips for quick tests
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
##D # Fit the FPK model using ML: 
##D # In all clades the macroevolutionary landscape is the same 
##D #but they have different evolutionary rates
##D testbFPK4=lnl_FPK_multiclades_same_V_different_sig2(trees=TREES,
##D   traits=TRAITS,a=NULL,b=NULL,c=NULL,Npts=50)
##D fitbFPK4=find.mle_FPK_multiple_clades_same_V_different_sig2(model=testbFPK4,
##D   method='Nelder-Mead',init.optim=NULL)
##D 
##D # And now MCMC run
##D mcmc1=MH_MCMC_FPK_multiclades(trees=TREES,traits=TRAITS,
##D   bounds=fitmFPK4_SE$fits$fit_clade_1$par_fixed$bounds,Nsteps=10000,record_every=100,
##D   plot_every=200,Npts=25,pars_init=NULL,prob_update=NULL,verbose=TRUE,plot=TRUE,
##D   save_to='MCMC_FPK_test.Rdata',save_every=1000,type_priors=NULL,shape_priors=NULL,
##D   proposal_type='Normal',proposal_sensitivity=NULL,prior.only=F,burnin.plot=0.1)
##D 
##D get.landscape.FPK.MCMC(chain=mcmc1,bounds,Npts=100,burnin=0.1,probs.CI=c(0.25,0.75),
##D   COLOR_MEDIAN='red',COLOR_FILL='red',transparency=0.3,main='Macroevolutionary landscapes MCMC',
##D   ylab='N.exp(-V)',xlab='Trait',xlim=NULL,ylim=c(0,2))
##D   
## End(Not run)



