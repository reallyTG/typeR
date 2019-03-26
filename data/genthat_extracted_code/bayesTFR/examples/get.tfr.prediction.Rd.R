library(bayesTFR)


### Name: get.tfr.prediction
### Title: Accessing a Prediction Object
### Aliases: get.tfr.prediction has.tfr.prediction
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
pred <- get.tfr.prediction(sim.dir=sim.dir)
summary(pred, country="Canada")



