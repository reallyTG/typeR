library(SoilR)


### Name: ThreepFeedbackModel
### Title: Implementation of a three pool model with feedback structure
### Aliases: ThreepFeedbackModel

### ** Examples

t_start=0 
t_end=10 
tn=50
timestep=(t_end-t_start)/tn 
t=seq(t_start,t_end,timestep) 
ks=c(k1=0.8,k2=0.4,k3=0.2)
C0=c(C10=100,C20=150, C30=50)
In = 60

Temp=rnorm(t,15,1)
TempEffect=data.frame(t,fT.Daycent1(Temp))

Ex1=ThreepFeedbackModel(t=t,ks=ks,a21=0.5,a12=0.1,a32=0.2,a23=0.1,C0=C0,In=In,xi=TempEffect)
Ct=getC(Ex1)
Rt=getReleaseFlux(Ex1)

plot(
  t,
  rowSums(Ct),
  type="l",
  ylab="Carbon stocks (arbitrary units)",
  xlab="Time (arbitrary units)",
  lwd=2,
  ylim=c(0,sum(Ct[51,]))
) 
lines(t,Ct[,1],col=2)
lines(t,Ct[,2],col=4)
lines(t,Ct[,3],col=3)
legend(
  "topleft",
  c("Total C","C in pool 1", "C in pool 2","C in pool 3"),
  lty=c(1,1,1,1),
  col=c(1,2,4,3),
  lwd=c(2,1,1,1),
  bty="n"
)

plot(
  t,
  rowSums(Rt),
  type="l",
  ylab="Carbon released (arbitrary units)",
  xlab="Time (arbitrary units)",
  lwd=2,
  ylim=c(0,sum(Rt[51,]))
) 
lines(t,Rt[,1],col=2)
lines(t,Rt[,2],col=4)
lines(t,Rt[,3],col=3)
legend(
  "topleft",
  c("Total C release",
  "C release from pool 1",
  "C release from pool 2",
  "C release from pool 3"),
  lty=c(1,1,1,1),
  col=c(1,2,4,3),
  lwd=c(2,1,1,1),
  bty="n"
)

Inr=data.frame(t,Random.inputs=rnorm(length(t),50,10))
plot(Inr,type="l")

Ex2=ThreepFeedbackModel(t=t,ks=ks,a21=0.5,a12=0.1,a32=0.2,a23=0.1,C0=C0,In=Inr)
Ctr=getC(Ex2)
Rtr=getReleaseFlux(Ex2)

plot(
  t,
  rowSums(Ctr),
  type="l",
  ylab="Carbon stocks (arbitrary units)",
  xlab="Time (arbitrary units)",
  lwd=2,
  ylim=c(0,sum(Ctr[51,]))
) 
lines(t,Ctr[,1],col=2)
lines(t,Ctr[,2],col=4)
lines(t,Ctr[,3],col=3)
legend("topright",c("Total C","C in pool 1", "C in pool 2","C in pool 3"),
       lty=c(1,1,1,1),col=c(1,2,4,3),lwd=c(2,1,1,1),bty="n")

plot(t,rowSums(Rtr),type="l",ylab="Carbon released (arbitrary units)",
     xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Rtr[51,]))) 
lines(t,Rtr[,1],col=2)
lines(t,Rtr[,2],col=4)
lines(t,Rtr[,3],col=3)
legend(
  "topright",
  c("Total C release",
    "C release from pool 1",
    "C release from pool 2",
    "C release from pool 3"
  ),
  lty=c(1,1,1,1),
  col=c(1,2,4,3),
  lwd=c(2,1,1,1),
  bty="n")



