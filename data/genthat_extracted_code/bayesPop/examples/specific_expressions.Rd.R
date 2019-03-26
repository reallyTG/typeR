library(bayesPop)


### Name: mac.expression
### Title: Expression Generator
### Aliases: mac.expression
### Keywords: manip

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D # Run pop.predict with storing vital events
##D pred <- pop.predict(countries=c("Germany", "France"), nr.traj=3, 
##D            keep.vital.events=TRUE, output.dir=sim.dir)
##D # plot the mean age of childbearing 
##D pop.trajectories.plot(pred, expression=mac.expression("FR"), cex.main = 0.7)
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)


