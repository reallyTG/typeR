library(betareg)


### Name: WeatherTask
### Title: Weather Task With Priming and Precise and Imprecise
###   Probabilities
### Aliases: WeatherTask
### Keywords: datasets

### ** Examples

data("WeatherTask", package = "betareg")
library("flexmix")
wt_betamix <- betamix(agreement ~ 1, data = WeatherTask, k = 2,
  extra_components = extraComponent(type = "betareg", coef =
    list(mean = 0, precision = 2)),
  FLXconcomitant = FLXPmultinom(~ priming + eliciting))



