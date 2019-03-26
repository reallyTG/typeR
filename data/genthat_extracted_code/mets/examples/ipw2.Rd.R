library(mets)


### Name: ipw2
### Title: Inverse Probability of Censoring Weights
### Aliases: ipw2

### ** Examples

library("timereg")
d <- simnordic.random(3000,delayed=TRUE,ptrunc=0.7,
      cordz=0.5,cormz=2,lam0=0.3,country=FALSE)
d$strata <- as.numeric(d$country)+(d$zyg=="MZ")*4
times <- seq(60,100,by=10)
c1 <- comp.risk(Event(time,cause)~1+cluster(id),data=d,cause=1,
	model="fg",times=times,max.clust=NULL,n.sim=0)
mm=model.matrix(~-1+zyg,data=d)
out1<-random.cif(c1,data=d,cause1=1,cause2=1,same.cens=TRUE,theta.des=mm)
summary(out1)
pc1 <- predict(c1,X=1,se=0)
plot(pc1)

dl <- d[!d$truncated,]
dl <- ipw2(dl,cluster="id",same.cens=TRUE,time="time",entrytime="entry",cause="cause",
           strata="strata",prec.factor=100)
cl <- comp.risk(Event(time,cause)~+1+
		cluster(id),
		data=dl,cause=1,model="fg",
		weights=dl$indi.weights,cens.weights=rep(1,nrow(dl)),
            times=times,max.clust=NULL,n.sim=0)
pcl <- predict(cl,X=1,se=0)
lines(pcl$time,pcl$P1,col=2)
mm=model.matrix(~-1+factor(zyg),data=dl)
out2<-random.cif(cl,data=dl,cause1=1,cause2=1,theta.des=mm,
                 weights=dl$weights,censoring.weights=rep(1,nrow(dl)))
summary(out2)



