library(bayou)


### Name: OUphenogram
### Title: Experimental phenogram plotting function for set of model of
###   model parameters
### Aliases: OUphenogram

### ** Examples

## Not run: 
##D tree <- sim.bdtree(n=50)
##D tree$edge.length <- tree$edge.length/max(branching.times(tree))
##D prior <- make.prior(tree, dists=list(dk="cdpois", dsig2="dnorm", 
##D            dtheta="dnorm"), param=list(dk=list(lambda=5, kmax=10), 
##D              dsig2=list(mean=1, sd=0.01), dtheta=list(mean=0, sd=3)), 
##D                plot.prior=FALSE)
##D pars <- priorSim(prior, tree, plot=FALSE, nsim=1)$pars[[1]]
##D pars$alpha <- 4
##D dat <- dataSim(pars, model="OU", phenogram=FALSE, tree)$dat
##D OUphenogram(pars, tree, dat, ftype="off")
## End(Not run)



