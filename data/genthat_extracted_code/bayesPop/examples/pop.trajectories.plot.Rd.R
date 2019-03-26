library(bayesPop)


### Name: pop.trajectories.plot
### Title: Output of Probabilistic Population Projection
### Aliases: pop.trajectories.plot pop.trajectories.plotAll
###   pop.trajectories.table pop.byage.plot pop.byage.plotAll
###   pop.byage.table
### Keywords: hplot

### ** Examples

sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
pred <- get.pop.prediction(sim.dir)
pop.trajectories.plot(pred, country="Ecuador", pi=c(80, 95))
pop.trajectories.table(pred, country="Ecuador", pi=c(80, 95))
# female population of Ecuador in child bearing ages (by time)
pop.trajectories.plot(pred, expression="PEC_F[4:10]") 
# Population by age in Netherands for two different years 
pop.byage.plot(pred, country="Netherlands", year=2050)
pop.byage.plot(pred, expression="PNL{}", year=2000)



