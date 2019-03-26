library(SoilR)


### Name: fW.Standcarb
### Title: Effects of moisture on decomposition rates according to the
###   StandCarb model
### Aliases: fW.Standcarb

### ** Examples

MC=0:500
DeadFoliage=fW.Standcarb(MC)
DeadBranch=fW.Standcarb(MC,MoistMax=200)
DeadWood=fW.Standcarb(MC,MoistMax=150)
StableSoil=fW.Standcarb(MC,MoistMin=15,MoistMax=100)
plot(MC,DeadFoliage$MoistDecayIndex,type="l",xlab="Moisture Content (%)",
     ylab="f(W) (unitless)",
     main="Effects of moisture on decomposition rates according to the StandCarb model")
lines(MC,DeadBranch$MoistDecayIndex,col=4)
lines(MC,DeadWood$MoistDecayIndex,col=3)
lines(MC,StableSoil$MoistDecayIndex,col=2)
legend("topright",c("Dead Foliage","Dead Branch","Dead Wood","Stable Soil"),
       lty=c(1,1,1),col=c(1,4,3,2),bty="n")



