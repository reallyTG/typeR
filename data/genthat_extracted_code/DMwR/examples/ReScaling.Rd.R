library(DMwR)


### Name: ReScaling
### Title: Re-scales a set of continuous values into a new range using a
###   linear scaling
### Aliases: ReScaling
### Keywords: models

### ** Examples

## A simple example with the algae data set
summary(LinearScaling(algae[,'NO3']))
summary(ReScaling(LinearScaling(algae[,'NO3']),-10,10))



