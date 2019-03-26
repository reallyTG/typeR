library(geotech)


### Name: MohrCircle
### Title: Mohr Circle Calculations
### Aliases: MohrCircle sigmaTrans MohrCircle.calc MohrCircle.plot sigma13
###   tauMax

### ** Examples


##  Example code for Stress Transformation
sigmaTrans(sigmaX = 80, sigmaZ = 120, tauXZ = 20, theta = 78)

##  Example code for Mohr Circle Calculations
MohrCircle.calc(theta = 20, sigmaX = 80, sigmaZ = 120, tauXZ = 20)

##  Example code for Mohr Circle Plot
MohrCircle.plot(sigmaX = 80, sigmaZ = 120, tauXZ = 20, metric = FALSE)

##  Example code for Principal Stresses
sigma13(sigmaX = 80, sigmaZ = 120, tauXZ = 20)

##  Example code for Maximum In-Plane Shear Stress
tauMax(sigmaX = 80, sigmaZ = 120, tauXZ = 20)



