library(BBMV)


### Name: posterior_vs_prior
### Title: Posterior vs. prior comparison for the FPK model.
### Aliases: posterior_vs_prior

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
##D # Run a MCMC chain to fit the FPK model
##D MCMC=MH_MCMC_FPK(tree,trait=TRAIT,bounds=c(5,5),Nsteps=10000,record_every=100,
##D   plot_every=100,Npts=20,pars_init=c(0,-4,-4,0,1),prob_update=c(0.2,0.25,0.25,0.25,0.05),
##D   verbose=TRUE,plot=TRUE,save_to='MCMC_FPK_test.Rdata',save_every=100,
##D   type_priors=c(rep('Normal',4),'Uniform'),
##D   shape_priors=list(c(0,10),c(0,10),c(0,10),c(0,10),NA),proposal_type='Uniform',
##D   proposal_sensitivity=c(0.1,0.1,0.1,0.1,1),prior.only=F)
##D get.landscape.FPK.MCMC(chain=MCMC,bounds=c(5,5),Npts=100,burnin=0.1,
##D   probs.CI=c(0.025,0.975),COLOR_MEDIAN='red',COLOR_FILL='red',transparency=0.3,
##D   main='Macroevolutionary landscapes MCMC',ylab='N.exp(-V)',xlab='Trait',
##D   xlim=NULL,ylim=NULL)  
##D posterior_vs_prior(chain=MCMC,param='a',Npts=100,burnin=0.2,type_prior='Normal',shape_prior=c(0,10))
## End(Not run)



