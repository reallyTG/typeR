library(wsyn)


### Name: addwpmfs
### Title: Adds wavelet phasor mean field information to a 'clust' object
### Aliases: addwpmfs

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
clustobj<-clust(dat,times,coords,method,nsurrogs = 100)
res<-addwpmfs(clustobj)




