library(openair)


### Name: modStats
### Title: Calculate common model evaluation statistics
### Aliases: modStats
### Keywords: methods

### ** Examples


## the example below is somewhat artificial --- assuming the observed
## values are given by NOx and the predicted values by NO2.

modStats(mydata, mod = "no2", obs = "nox")

## evaluation stats by season

modStats(mydata, mod = "no2", obs = "nox", type = "season")





