library(mkde)


### Name: initializeMovementData
### Title: Initialize a movement data list
### Aliases: initializeMovementData

### ** Examples

data(condor)
mv.dat <- initializeMovementData(condor$time, condor$x,
condor$y, z.obs=condor$z, 65.0, 25.0, sig2obs.z=81.0)



