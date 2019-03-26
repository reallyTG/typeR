library(SoilR)


### Name: OnepModel14
### Title: Implementation of a one-pool C14 model
### Aliases: OnepModel14

### ** Examples


years=seq(1901,2009,by=0.5)
LitterInput=700 

Ex=OnepModel14(t=years,k=1/10,C0=500, F0=0,In=LitterInput, inputFc=C14Atm_NH)
C14t=getF14(Ex)

plot(C14Atm_NH,type="l",xlab="Year",ylab="Delta 14C (per mil)",xlim=c(1940,2010)) 
lines(years, C14t[,1], col=4)
legend(
  "topright",
  c("Delta 14C Atmosphere", "Delta 14C in SOM"),
  lty=c(1,1),
  col=c(1,4),
  lwd=c(1,1),
  bty="n"
)




