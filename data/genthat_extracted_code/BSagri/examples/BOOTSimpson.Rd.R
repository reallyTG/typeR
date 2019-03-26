library(BSagri)


### Name: BOOTSimpson
### Title: Simultaneous confidence intervals for Simpson indices
### Aliases: BOOTSimpsonD BOOTSimpsonR
### Keywords: htest

### ** Examples


X<-t(rmultinom(n=40,size=100,
 prob=c(0.3,0.2,0.2,0.1,0.1,0.05,0.05)))

colnames(X)<-paste("Sp",1:7,sep="")

DAT<-as.data.frame(X)

f<-as.factor(rep(c("A","B","C","D"),each=10))

SCIdunnettd<-BOOTSimpsonD(X=DAT, f=f, type = "Dunnett",
 conf.level = 0.95, alternative = "two.sided", R=500)
 # with small no of bootstraps for illustration

SCIdunnettd





