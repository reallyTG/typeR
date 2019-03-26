library(bayesLife)


### Name: e0.trajectories.plot
### Title: Posterior Distribution of Trajectories of Life Expectancy
### Aliases: e0.trajectories.plot e0.trajectories.plot.all
###   e0.trajectories.table
### Keywords: hplot

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
##D pred <- get.e0.prediction(sim.dir)
##D e0.trajectories.table(pred, country="Japan", pi=c(80, 95))
##D e0.trajectories.plot(pred, country="Japan", pi=c(80, 95))
##D 
##D # plot multiple countries into one plot
##D e0.trajectories.plot(pred, "Japan", col=rep("green", 5), nr.traj=0, pi=c(80), 
##D         show.legend=FALSE, main="")
##D e0.trajectories.plot(pred, "United States of America", col=rep("blue", 5),  
##D         add=TRUE, nr.traj=0, pi=c(80), show.legend=FALSE)
##D legend("topleft", legend=c("Japan", "USA"), col=c("green", "blue"), lty=1, bty="n")
## End(Not run)


