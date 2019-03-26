library(kmlShape)


### Name: meanFrechet2
### Title: ~ Function: meanFrechet2 ~
### Aliases: meanFrechet2

### ** Examples

traj <- matrix(0,4,5)
traj[1,2] <- 10
traj[2,3] <- 11
traj[3,4] <- 10
traj[4,2] <- 8

matplot(x=1:5,y=t(traj),type="l",col=2:5,lty=1)
m12 <- meanFrechet2(Px=1:5,Py=traj[1,],Qx=1:5,Qy=traj[2,])
m34 <- meanFrechet2(Px=1:5,Py=traj[3,],Qx=1:5,Qy=traj[4,])
lines(m12,col=2,lwd=3)
lines(m34,col=2,lwd=3)

m1234 <- meanFrechet2(Px=m12$times,Py=m12$traj,Qx=m34$times,Qy=m34$traj)
lines(m1234,col=1,lwd=5)



