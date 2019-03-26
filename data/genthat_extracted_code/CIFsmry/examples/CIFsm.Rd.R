library(CIFsmry)


### Name: CIFsm
### Title: Cumulative incidence function estimate and weighted summary
###   statistics
### Aliases: CIFsm
### Keywords: cumulative incidence function summary statistics weight
###   function

### ** Examples

library(CIFsmry)
data(sim.dat)
out <- CIFsm(sim.dat,pp=0,qq=0)
out$avepval
plot(out$tjp,out$f1,type="s",ylim=c(0,1),yaxt="n",xaxt="n",xlab="Time",ylab="CIF",
     lty=1,lwd=1)
points(out$tjp,out$f2,type="s",lty=1,lwd=3)
axis(1,at=seq(0,6,by=1),cex=0.6)
axis(2,at=seq(0,1,by=0.2),cex=0.6)
legend("bottomright",c("1","2"),title="group",lty=1,lwd=c(1,3))

out10 <- CIFsm(sim.dat,pp=1,qq=0)
out10$avepval



