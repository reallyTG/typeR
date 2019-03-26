library(mkde)


### Name: estVarMKDE
### Title: Estimate move variances for 3D MKDE.
### Aliases: estVarMKDE

### ** Examples

data(condor)
mv.dat <- initializeMovementData(condor$time, condor$x, condor$y, 
z.obs=condor$z, sig2obs=25.0, sig2obs.z=81.0, t.max=65.0)

mv.dat <- estVarMKDE(mv.dat)
cat(paste("Move variance in xy-dimensions = ",
mv.dat$sig2xy[1], "\n", sep=""))
cat(paste("Move variance in z-dimension = ",
mv.dat$sig2.z[1], "\n", sep=""))



