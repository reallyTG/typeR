library(CompDist)


### Name: rcomp
### Title: rcomp
### Aliases: rcomp
### Keywords: Random number generation

### ** Examples
par<-list()

distvec<-c("lnorm","gamma")

par[[1]]<-c(0,1,Inf)

par[[2]]<-c(1)

par[[3]]<-c(0,1)

par[[4]]<-c(1,1)


n<-1000

# non-continuous case

y1<-rcomp(n,distvec,par)

# continuous case

y2<-rcomp(n,distvec,par,borders=list(c(0.00001,10)),buffer=c(10e-5,0))


par(mfrow=c(1,2),oma=rep(0,4))

hist(y1,nclass=10,xlab="x",ylab="Frequency",main="")

hist(y2,nclass=10,xlab="x",ylab="Frequency",main="")


