library(timereg)


### Name: plot.aalen
### Title: Plots estimates and test-processes
### Aliases: plot.aalen plot.cox.aalen plot.timecox plot.prop.excess
### Keywords: survival

### ** Examples


# see help(aalen) 
data(sTRACE)
out<-aalen(Surv(time,status==9)~chf+vf,sTRACE,max.time=7,n.sim=100)
par(mfrow=c(2,2))
plot(out,pointwise.ci=1,hw.ci=1,sim.ci=1,col=c(1,2,3,4))
par(mfrow=c(2,2))
plot(out,pointwise.ci=0,robust.ci=1,hw.ci=1,sim.ci=1,col=c(1,2,3,4))




