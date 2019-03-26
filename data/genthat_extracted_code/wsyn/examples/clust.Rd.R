library(wsyn)


### Name: clust
### Title: Detection and description of clusters of synchronous locations
### Aliases: clust

### ** Examples

sig<-matrix(.8,5,5)
diag(sig)<-1
lents<-50
dat1<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
dat2<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
dat<-rbind(dat1,dat2)
times<-1:lents
dat<-cleandat(dat,times,clev=1)$cdat
coords<-data.frame(Y=rep(0,10),X=1:10)
method<-"coh.sig.fast"
res<-clust(dat,times,coords,method,nsurrogs = 50)
#nsurrogs should be much higher for a real application




