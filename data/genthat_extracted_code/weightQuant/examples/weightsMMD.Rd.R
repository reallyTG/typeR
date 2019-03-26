library(weightQuant)


### Name: weightsMMD
### Title: Estimation of observation-specific weights with monotone missing
###   data
### Aliases: weightsMMD

### ** Examples

w_simdata <- weightsMMD(data=simdata,Y="Ytrunc",X1="X", X2=NULL,
subject="id", death="death", time="time", interval.death = 0)$data



