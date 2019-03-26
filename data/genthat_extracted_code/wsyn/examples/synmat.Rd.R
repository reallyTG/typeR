library(wsyn)


### Name: synmat
### Title: Synchrony matrices
### Aliases: synmat

### ** Examples

sig<-matrix(.9,5,5)
diag(sig)<-1
dat1<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
dat2<-t(mvtnorm::rmvnorm(30,mean=rep(0,5),sigma=sig))
dat<-rbind(dat1,dat2)
times<-1:30
dat<-cleandat(dat,times,clev=2)$cdat
method<-"pearson.sig.fft"
res<-synmat(dat,times,method,nsurrogs=100,weighted=FALSE,
            sigthresh=0.95)
  



