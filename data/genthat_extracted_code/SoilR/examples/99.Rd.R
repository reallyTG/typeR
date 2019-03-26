library(SoilR)


### Name: TwopSeriesModel
### Title: Implementation of a two pool model with series structure
### Aliases: TwopSeriesModel

### ** Examples

t_start=0 
t_end=10 
tn=50
timestep=(t_end-t_start)/tn 
t=seq(t_start,t_end,timestep) 
ks=c(k1=0.8,k2=0.4)
a21=0.5
C0=c(C10=100,C20=150)
In = 30

Temp=rnorm(t,15,1)
TempEffect=data.frame(t,fT.Daycent1(Temp))

Ex1=TwopSeriesModel(t,ks,a21,C0,In,xi=TempEffect)
Ct=getC(Ex1)
Rt=getReleaseFlux(Ex1)

plot(t,rowSums(Ct),type="l",ylab="Carbon stocks (arbitrary units)",
     xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Ct[1,]))) 
lines(t,Ct[,1],col=2)
lines(t,Ct[,2],col=4) 
legend("bottomright",c("Total C","C in pool 1", "C in pool 2"),
       lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")

plot(t,rowSums(Rt),type="l",ylab="Carbon released (arbitrary units)",
     xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Rt[1,]))) 
lines(t,Rt[,1],col=2)
lines(t,Rt[,2],col=4) 
legend("topright",c("Total C release","C release from pool 1", "C release from pool 2"),
       lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")

Inr=data.frame(t,Random.inputs=rnorm(length(t),30,5))
plot(Inr)

Ex2=TwopSeriesModel(t,ks,a21,C0,In=Inr,xi=fT.Q10(15))
Ctr=getC(Ex2)
Rtr=getReleaseFlux(Ex2)

plot(t,rowSums(Ctr),type="l",ylab="Carbon stocks (arbitrary units)",
     xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Ctr[1,]))) 
lines(t,Ctr[,1],col=2)
lines(t,Ctr[,2],col=4) 
legend("topright",c("Total C","C in pool 1", "C in pool 2"),
       lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")

plot(t,rowSums(Rtr),type="l",ylab="Carbon released (arbitrary units)",
     xlab="Time (arbitrary units)",lwd=2,ylim=c(0,sum(Rtr[1,]))) 
lines(t,Rtr[,1],col=2)
lines(t,Rtr[,2],col=4) 
legend("topright",c("Total C release","C release from pool 1", "C release from pool 2"),
       lty=c(1,1,1),col=c(1,2,4),lwd=c(2,1,1),bty="n")



