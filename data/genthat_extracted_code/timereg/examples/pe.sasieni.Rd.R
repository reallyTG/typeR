library(timereg)


### Name: pe.sasieni
### Title: Fits Proportional excess hazards model with fixed offsets
### Aliases: pe.sasieni summary.pe-sasieni
### Keywords: survival

### ** Examples


data(mela.pop)
out<-pe.sasieni(Surv(start,stop,status==1)~age+sex,mela.pop,
id=1:205,Nit=10,max.time=7,offsets=mela.pop$rate,detail=0,n.sim=100)
summary(out)

ul<-out$cum[,2]+1.96*out$var.cum[,2]^.5
ll<-out$cum[,2]-1.96*out$var.cum[,2]^.5
plot(out$cum,type="s",ylim=range(ul,ll))
lines(out$cum[,1],ul,type="s"); lines(out$cum[,1],ll,type="s")
# see also prop.excess function




