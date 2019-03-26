library(SoilR)


### Name: fW.Century
### Title: Effects of moisture on decomposition rates according to the
###   CENTURY model
### Aliases: fW.Century

### ** Examples

PPT=seq(0,1500,by=10)
PET=rep(1500,length(PPT))
PPT.PET=fW.Century(PPT,PET)
plot(PPT/PET,PPT.PET, 
     ylab="f(PPT, PET) (unitless)", 
     main="Effects of precipitation and potential evapotranspiration on decomposition rates")



