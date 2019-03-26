library(betareg)


### Name: CarTask
### Title: Partition-primed Probability Judgement Task for Car Dealership
### Aliases: CarTask
### Keywords: datasets

### ** Examples

data("CarTask", package = "betareg")
library("flexmix")
car_betamix <- betamix(probability ~ 1, data = CarTask, k = 3,
  extra_components = list(extraComponent(type = "uniform", coef = 1/2,
  delta = 0.01), extraComponent(type = "uniform", coef = 1/4, delta = 0.01)),
  FLXconcomitant = FLXPmultinom(~ task))



