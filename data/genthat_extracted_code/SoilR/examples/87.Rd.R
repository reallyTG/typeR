library(SoilR)


### Name: ThreepParallelModel14
### Title: Implementation of a three-pool C14 model with parallel structure
### Aliases: ThreepParallelModel14

### ** Examples


years=seq(1901,2009,by=0.5)
LitterInput=700 

Ex=ThreepParallelModel14(
  t=years,
  ks=c(k1=1/2.8, k2=1/35, k3=1/100),
  C0=c(200,5000,500),
  F0_Delta14C=c(0,0,0),
  In=LitterInput,
  gam1=0.7,
  gam2=0.1,
  inputFc=C14Atm_NH,
  lag=2
)
R14m=getF14R(Ex)
C14m=getF14C(Ex)
C14t=getF14(Ex)

par(mfrow=c(2,1))
plot(C14Atm_NH,type="l",xlab="Year",ylab="Delta 14C (per mil)",xlim=c(1940,2010)) 
lines(years, C14t[,1], col=4)
lines(years, C14t[,2],col=4,lwd=2)
lines(years, C14t[,3],col=4,lwd=3)
legend(
  "topright",
  c(
    "Delta 14C Atmosphere", 
    "Delta 14C pool 1",
    "Delta 14C pool 2", 
    "Delta 14C pool 3"
  ),
  lty=rep(1,4),
  col=c(1,4,4,4),
  lwd=c(1,1,2,3),
  bty="n"
)

plot(C14Atm_NH,type="l",xlab="Year",ylab="Delta 14C (per mil)",xlim=c(1940,2010)) 
lines(years,C14m,col=4)
lines(years,R14m,col=2)
legend("topright",c("Delta 14C Atmosphere","Delta 14C SOM", "Delta 14C Respired"),
       lty=c(1,1,1), col=c(1,4,2),bty="n")
par(mfrow=c(1,1))



