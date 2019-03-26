library(bayesTFR)


### Name: get.tfr.trajectories
### Title: Accessing TFR Trajectories
### Aliases: get.tfr.trajectories
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output") 
pred <- get.tfr.prediction(sim.dir=sim.dir)
get.tfr.trajectories(pred, "Germany")



