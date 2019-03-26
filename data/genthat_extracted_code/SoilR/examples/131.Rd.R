library(SoilR)


### Name: fW.Gompertz
### Title: Effects of moisture on decomposition rates according to the
###   Gompertz function
### Aliases: fW.Gompertz

### ** Examples

th=seq(0,1,0.01)
xi=fW.Gompertz(theta=th)
plot(th,xi,type="l",main="Effects of soil water content on decomposition rates",
     xlab="Volumetric soil water content (cm3 cm-3)",ylab=expression(xi))



