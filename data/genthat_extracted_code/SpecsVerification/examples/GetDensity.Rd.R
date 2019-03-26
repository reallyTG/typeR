library(SpecsVerification)


### Name: GetDensity
### Title: Calculate density and integrated density function of a dressed
###   ensemble forecast at a matrix of values
### Aliases: GetDensity

### ** Examples

 data(eurotempforecast)
 dressed.ens <- DressEnsemble(ens)
 # calculate each density at the same x-values
 x1 <- matrix(seq(-3, 3, 0.1), nrow=1)
 dens1 <- GetDensity(dressed.ens, x1)
 # get the densities that the forecast 
 # distributions assign to the observations
 x2 <- matrix(obs, ncol=1)
 dens2 <- GetDensity(dressed.ens, x2)
 # get the integrated densities that the forecast 
 # distributions assign to the observations (useful
 # for constructing a PIT histogram)
 pit <- GetDensity(dressed.ens, x2, integrated=TRUE)



