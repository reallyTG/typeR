library(SoilR)


### Name: ThreepSeriesModel14
### Title: Implementation of a three-pool C14 model with series structure
### Aliases: ThreepSeriesModel14

### ** Examples


years=seq(1901,2009,by=0.5)
LitterInput=700 

Ex=ThreepSeriesModel14(
  t=years,ks=c(k1=1/2.8, k2=1/35, k3=1/100),
  C0=c(200,5000,500), F0_Delta14C=c(0,0,0),
  In=LitterInput, a21=0.1, a32=0.01,inputFc=C14Atm_NH
)
R14m=getF14R(Ex)
C14m=getF14C(Ex)
C14t=getF14(Ex)

par(mfrow=c(2,1))
plot(C14Atm_NH,type="l",xlab="Year",
     ylab="Delta 14C (per mil)",xlim=c(1940,2010)) 
lines(years, C14t[,1], col=4)
lines(years, C14t[,2],col=4,lwd=2)
lines(years, C14t[,3],col=4,lwd=3)
legend(
  "topright",
  c("Delta 14C Atmosphere", "Delta 14C pool 1", "Delta 14C pool 2", "Delta 14C pool 3"),
  lty=rep(1,4),col=c(1,4,4,4),lwd=c(1,1,2,3),bty="n")

plot(C14Atm_NH,type="l",xlab="Year",ylab="Delta 14C (per mil)",xlim=c(1940,2010)) 
lines(years,C14m,col=4)
lines(years,R14m,col=2)
legend("topright",c("Delta 14C Atmosphere","Delta 14C SOM", "Delta 14C Respired"),
       lty=c(1,1,1), col=c(1,4,2),bty="n")
par(mfrow=c(1,1))



