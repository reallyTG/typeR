library(SoilR)


### Name: fW.Moyano
### Title: Effects of moisture on decomposition rates according to the
###   function proposed by Moyano et al. (2013)
### Aliases: fW.Moyano

### ** Examples

th=seq(0,1,0.01)
xi=fW.Moyano(theta=th)
plot(th,xi,type="l",main="Effects of soil water content on decomposition rates",
     xlab="Volumetric soil water content (cm3 cm-3)",ylab=expression(xi))



