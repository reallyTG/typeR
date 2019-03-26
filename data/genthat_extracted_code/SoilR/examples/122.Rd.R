library(SoilR)


### Name: fT.Q10
### Title: Effects of temperature on decomposition rates according to a Q10
###   function
### Aliases: fT.Q10

### ** Examples

Temperature=0:50
plot(Temperature,fT.Q10(Temperature),type="l",ylab="f(T) (unitless)", 
     main="Effects of temperature on decomposition rates according to a Q10 function")
lines(Temperature, fT.Q10(Temperature,Q10=2.2),col=2)
lines(Temperature, fT.Q10(Temperature,Q10=1.4),col=4)
legend("topleft",c("Q10 = 2", "Q10 = 2.2", "Q10 = 1.4"),lty=c(1,1,1),col=c(1,2,4),bty="n")



