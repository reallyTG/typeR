library(SkewHyperbolic)


### Name: skewhypMom
### Title: Calculate Moments of the Skew Hyperbolic Student t-Distribution.
### Aliases: skewhypMom
### Keywords: distribution

### ** Examples

param = c(1,2,3,10)
##Raw moments of the skew hyperbolic t distribution
skewhypMom(3, param = param, momType = "raw")
##Mu moments
skewhypMom(3, param = param, momType = "mu")
##Central moments
skewhypMom(3, param = param, momType = "central")
##Moments about any location
skewhypMom(3, param = param, about = 5)



