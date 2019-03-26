library(clusterPower)


### Name: power.sim.normal
### Title: Power simulations for cluster-randomized crossover study
###   designs.
### Aliases: power.sim.normal power.sim.binomial power.sim.poisson
###   make.base.data

### ** Examples

## Not run: 
##D a <- power.sim.normal(n.sim=10, effect.size=5, alpha=.05, n.clusters=2, n.periods=2, 
##D   cluster.size=20, btw.clust.var=5, ICC=1/20, period.effect=2, 
##D   estimation.function=fixed.effect, verbose=TRUE, period.var=0)
##D   
##D b <- power.sim.binomial(n.sim=10, effect.size=log(.75), alpha=.05, n.clusters=20, n.periods=2, 
##D   cluster.size=50, btw.clust.var=.2, period.effect=logit(.2), 
##D   estimation.function=random.effect, verbose=TRUE, period.var=0)
##D 
##D c <- power.sim.poisson(n.sim=10, effect.size=log(.75), alpha=.05, n.clusters=100, n.periods=2, 
##D   cluster.size=10, btw.clust.var=.4, period.effect=log(.2), 
##D   estimation.function=random.effect, verbose=TRUE, period.var=0, at.risk.params=10)
## End(Not run)




