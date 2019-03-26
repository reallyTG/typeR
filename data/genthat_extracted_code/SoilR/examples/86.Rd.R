library(SoilR)


### Name: ThreepParallelModel
### Title: Implementation of a three pool model with parallel structure
### Aliases: ThreepParallelModel

### ** Examples

t_start=0 
t_end=10 
tn=50
timestep=(t_end-t_start)/tn 
t=seq(t_start,t_end,timestep) 

Ex=ThreepParallelModel(t,ks=c(k1=0.5,k2=0.2,k3=0.1),
                       C0=c(c10=100, c20=150,c30=50),In=20,gam1=0.7,gam2=0.1,xi=0.5)
Ct=getC(Ex)

plot(t,rowSums(Ct),type="l",lwd=2,
     ylab="Carbon stocks (arbitrary units)",xlab="Time",ylim=c(0,sum(Ct[1,]))) 
lines(t,Ct[,1],col=2)
lines(t,Ct[,2],col=4)
lines(t,Ct[,3],col=3)
legend("topright",c("Total C","C in pool 1", "C in pool 2","C in pool 3"),
       lty=c(1,1,1,1),col=c(1,2,4,3),lwd=c(2,1,1,1),bty="n")

Rt=getReleaseFlux(Ex)
plot(t,rowSums(Rt),type="l",ylab="Carbon released (arbitrary units)",
     xlab="Time",lwd=2,ylim=c(0,sum(Rt[1,]))) 
lines(t,Rt[,1],col=2)
lines(t,Rt[,2],col=4)
lines(t,Rt[,3],col=3)
legend("topright",c("Total C release","C release from pool 1",
       "C release from pool 2","C release from pool 3"),
        lty=c(1,1,1,1),col=c(1,2,4,3),lwd=c(2,1,1,1),bty="n")



