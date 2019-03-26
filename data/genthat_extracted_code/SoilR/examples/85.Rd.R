library(SoilR)


### Name: ThreepFeedbackModel14
### Title: Implementation of a three-pool C14 model with feedback structure
### Aliases: ThreepFeedbackModel14

### ** Examples


years=seq(1901,2009,by=0.5)
LitterInput=100
k1=1/2; k2=1/10; k3=1/50
a21=0.9*k1
a12=0.4*k2
a32=0.4*k2
a23=0.7*k3

Feedback=ThreepFeedbackModel14(
  t=years,
  ks=c(k1=k1, k2=k2, k3=k3),
  C0=c(100,500,1000),
  F0_Delta14C=c(0,0,0),
  In=LitterInput,
  a21=a21,
  a12=a12,
  a32=a32,
  a23=a23,
  inputFc=C14Atm_NH
)
F.R14m=getF14R(Feedback)
F.C14m=getF14C(Feedback)
F.C14t=getF14(Feedback)

Series=ThreepSeriesModel14(
  t=years,
  ks=c(k1=k1, k2=k2, k3=k3),
  C0=c(100,500,1000),
  F0_Delta14C=c(0,0,0),
  In=LitterInput,
  a21=a21,
  a32=a32,
  inputFc=C14Atm_NH
)
S.R14m=getF14R(Series)
S.C14m=getF14C(Series)
S.C14t=getF14(Series)

Parallel=ThreepParallelModel14(
  t=years,
  ks=c(k1=k1, k2=k2, k3=k3),
  C0=c(100,500,1000),
  F0_Delta14C=c(0,0,0),
  In=LitterInput,
  gam1=0.6,
  gam2=0.2,
  inputFc=C14Atm_NH,
  lag=2
)
P.R14m=getF14R(Parallel)
P.C14m=getF14C(Parallel)
P.C14t=getF14(Parallel)

par(mfrow=c(3,2))
plot(
  C14Atm_NH,
  type="l",
  xlab="Year",
  ylab=expression(paste(Delta^14,"C ","(\u2030)")),
  xlim=c(1940,2010)
) 
lines(years, P.C14t[,1], col=4)
lines(years, P.C14t[,2],col=4,lwd=2)
lines(years, P.C14t[,3],col=4,lwd=3)
legend(
  "topright",
  c("Atmosphere", "Pool 1", "Pool 2", "Pool 3"),
  lty=rep(1,4),
  col=c(1,4,4,4),
  lwd=c(1,1,2,3),
  bty="n"
)

plot(C14Atm_NH,type="l",xlab="Year",
     ylab=expression(paste(Delta^14,"C ","(\u2030)")),xlim=c(1940,2010)) 
lines(years,P.C14m,col=4)
lines(years,P.R14m,col=2)
legend("topright",c("Atmosphere","Bulk SOM", "Respired C"),
       lty=c(1,1,1), col=c(1,4,2),bty="n")

plot(C14Atm_NH,type="l",xlab="Year",
     ylab=expression(paste(Delta^14,"C ","(\u2030)")),xlim=c(1940,2010)) 
lines(years, S.C14t[,1], col=4)
lines(years, S.C14t[,2],col=4,lwd=2)
lines(years, S.C14t[,3],col=4,lwd=3)
legend("topright",c("Atmosphere", "Pool 1", "Pool 2", "Pool 3"),
       lty=rep(1,4),col=c(1,4,4,4),lwd=c(1,1,2,3),bty="n")

plot(C14Atm_NH,type="l",xlab="Year",
     ylab=expression(paste(Delta^14,"C ","(\u2030)")),xlim=c(1940,2010)) 
lines(years,S.C14m,col=4)
lines(years,S.R14m,col=2)
legend("topright",c("Atmosphere","Bulk SOM", "Respired C"),
       lty=c(1,1,1), col=c(1,4,2),bty="n")

plot(C14Atm_NH,type="l",xlab="Year",
     ylab=expression(paste(Delta^14,"C ","(\u2030)")),xlim=c(1940,2010)) 
lines(years, F.C14t[,1], col=4)
lines(years, F.C14t[,2],col=4,lwd=2)
lines(years, F.C14t[,3],col=4,lwd=3)
legend("topright",c("Atmosphere", "Pool 1", "Pool 2", "Pool 3"),
       lty=rep(1,4),col=c(1,4,4,4),lwd=c(1,1,2,3),bty="n")

plot(C14Atm_NH,type="l",xlab="Year",
     ylab=expression(paste(Delta^14,"C ","(\u2030)")),xlim=c(1940,2010)) 
lines(years,F.C14m,col=4)
lines(years,F.R14m,col=2)
legend("topright",c("Atmosphere","Bulk SOM", "Respired C"),
       lty=c(1,1,1), col=c(1,4,2),bty="n")


par(mfrow=c(1,1))




