library(bayesLife)


### Name: get.e0.prediction
### Title: Accessing a Prediction Object
### Aliases: get.e0.prediction get.e0.jmale.prediction has.e0.prediction
###   has.e0.jmale.prediction
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
pred <- get.e0.prediction(sim.dir=sim.dir)
summary(pred, country="Canada")



