library(SoilR)


### Name: fW.Candy
### Title: Effects of moisture on decomposition rates according to the
###   Candy model
### Aliases: fW.Candy

### ** Examples

th=seq(0,1,0.01)
xi1=fW.Candy(theta=th,PV=0.4)
xi2=fW.Candy(theta=th,PV=0.6)
xi3=fW.Candy(theta=th,PV=0.8)
plot(th,xi1,type="l",main="Effects of soil water content and pore volume on decomposition rates",
     xlab="Volumetric soil water content (cm3 cm-3)",ylab=expression(xi))
lines(th,xi2,col=2)
lines(th,xi3,col=3)
legend("bottomright",c("Pore volume = 0.4","Pore volume = 0.6", "Pore volume = 0.8"),lty=1,col=1:3)



