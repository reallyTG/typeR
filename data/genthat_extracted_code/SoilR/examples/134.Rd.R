library(SoilR)


### Name: fW.Skopp
### Title: Effects of moisture on decomposition rates according to the
###   function proposed by Skopp et al. 1990
### Aliases: fW.Skopp

### ** Examples

th=seq(0,1,0.01)
xi=fW.Skopp(rwc=th)
plot(th,xi,type="l",main="Effects of soil water content on decomposition rates",
     xlab="Relative water content",ylab=expression(xi))



