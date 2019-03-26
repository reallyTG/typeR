library(bayesPop)


### Name: summary.bayesPop.prediction
### Title: Summary of Probabilistic Population Projection
### Aliases: summary.bayesPop.prediction print.summary.bayesPop.prediction
### Keywords: univar print

### ** Examples

sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
pred <- get.pop.prediction(sim.dir)
summary(pred, "Netherlands")



