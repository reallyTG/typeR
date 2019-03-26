library(SoilR)


### Name: fT.LandT
### Title: Effects of temperature on decomposition rates according to a
###   function proposed by Lloyd and Taylor (1994)
### Aliases: fT.LandT

### ** Examples

Temperature=0:50
plot(Temperature,fT.LandT(Temperature),type="l",
     ylab="f(T) (unitless)", 
     main="Effects of temperature on decomposition 
     rates according to the Lloyd and Taylor function")



