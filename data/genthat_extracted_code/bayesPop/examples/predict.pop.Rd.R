library(bayesPop)


### Name: pop.predict
### Title: Probabilistic Population Projection
### Aliases: pop.predict bayesPop.prediction
### Keywords: distribution

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D # Countries can be given as a combination of numerical codes and names
##D pred <- pop.predict(countries=c("Netherlands", 218, "Madagascar"), nr.traj=3, 
##D            output.dir=sim.dir)
##D pop.trajectories.plot(pred, "Ecuador", sum.over.ages=TRUE)
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)


