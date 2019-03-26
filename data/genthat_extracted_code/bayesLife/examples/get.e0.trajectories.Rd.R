library(bayesLife)


### Name: get.e0.trajectories
### Title: Accessing Trajectories of Life Expectancy
### Aliases: get.e0.trajectories
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output") 
pred <- get.e0.prediction(sim.dir=sim.dir)
get.e0.trajectories(pred, "Germany")



