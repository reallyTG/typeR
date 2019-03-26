library(timereg)


### Name: restricted.residual.mean
### Title: Estimates restricted residual mean for Cox or Aalen model
### Aliases: restricted.residual.mean
### Keywords: survival

### ** Examples


## No test: 
### this example runs slowly and is therefore donttest
data(sTRACE)
sTRACE$cage <- scale(sTRACE$age)
# Fits Cox model  and aalen model 
out<-cox.aalen(Surv(time,status>=1)~prop(sex)+prop(diabetes)+prop(chf)+
	       prop(vf),data=sTRACE,max.timepoint.sim=NULL,resample.iid=1)
outa<-aalen(Surv(time,status>=1)~sex+diabetes+chf+vf,
data=sTRACE,resample.iid=1)

coxrm <- restricted.residual.mean(out,tau=7,
   x=rbind(c(0,0,0,0),c(0,0,1,0),c(0,0,1,1),c(0,0,0,1)),iid=1)
plot(coxrm)
summary(coxrm)

### aalen model not optimal here 
aalenrm <- restricted.residual.mean(outa,tau=7,
   x=rbind(c(1,0,0,0,0),c(1,0,0,1,0),c(1,0,0,1,1),c(1,0,0,0,1)),iid=1)
with(aalenrm,matlines(timetau,S0tau,type="s",ylim=c(0,1)))
legend("bottomleft",c("baseline","+chf","+chf+vf","+vf"),col=1:4,lty=1)
summary(aalenrm)

mm <-cbind(coxrm$mean,coxrm$se,aalenrm$mean,aalenrm$se)
colnames(mm)<-c("cox-res-mean","se","aalen-res-mean","se")
rownames(mm)<-c("baseline","+chf","+chf+vf","+vf")
mm
## End(No test)




