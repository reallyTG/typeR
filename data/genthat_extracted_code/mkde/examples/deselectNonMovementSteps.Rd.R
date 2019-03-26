library(mkde)


### Name: deselectNonMovementSteps
### Title: Flag non-movements so they are excluded from MKDE estimation
### Aliases: deselectNonMovementSteps

### ** Examples

data(condor)
mv.dat <- initializeMovementData(condor$time, condor$x, condor$y, 
z.obs=condor$z, sig2obs=25.0, sig2obs.z=81.0, t.max=65.0)

mv.dat <- deselectNonMovementSteps(mv.dat, 0.05)



