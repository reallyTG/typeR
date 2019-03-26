library(betareg)


### Name: ImpreciseTask
### Title: Imprecise Probabilities for Sunday Weather and Boeing Stock Task
### Aliases: ImpreciseTask
### Keywords: datasets

### ** Examples

data("ImpreciseTask", package = "betareg")
library("flexmix")
wt_betamix <- betamix(location ~ difference * task, data = ImpreciseTask, k = 2,
  extra_components = extraComponent(type = "betareg", coef =
    list(mean = 0, precision = 8)),
  FLXconcomitant = FLXPmultinom(~ task))



