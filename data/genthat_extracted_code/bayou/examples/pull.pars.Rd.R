library(bayou)


### Name: pull.pars
### Title: Utility function for retrieving parameters from an MCMC chain
### Aliases: pull.pars

### ** Examples

## Not run: 
##D tree <- sim.bdtree(n=30)
##D tree$edge.length <- tree$edge.length/max(branching.times(tree))
##D prior <- make.prior(tree, dists=list(dk="cdpois", dsig2="dnorm", 
##D              dtheta="dnorm"), 
##D                param=list(dk=list(lambda=15, kmax=32), 
##D                  dsig2=list(mean=1, sd=0.01), 
##D                    dtheta=list(mean=0, sd=3)), 
##D                      plot.prior=FALSE)
##D pars <- priorSim(prior, tree, plot=FALSE, nsim=1)$pars[[1]]
##D dat <- dataSim(pars, model="OU", phenogram=FALSE, tree)$dat
##D fit <- bayou.mcmc(tree, dat, model="OU", prior=prior, 
##D              new.dir=TRUE, ngen=5000, plot.freq=NULL)
##D chain <- load.bayou(fit, save.Rdata=TRUE, cleanup=TRUE)
##D plotBayoupars(pull.pars(300, chain), tree)
## End(Not run)



