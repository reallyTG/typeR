library(bayesLife)


### Name: summary.bayesLife.prediction
### Title: Summary of a Prediction of the Life Expectancy
### Aliases: summary.bayesLife.prediction
###   print.summary.bayesLife.prediction
### Keywords: univar print

### ** Examples

sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
pred <- get.e0.prediction(sim.dir=sim.dir)                                                    
summary(pred, country="Iceland")



