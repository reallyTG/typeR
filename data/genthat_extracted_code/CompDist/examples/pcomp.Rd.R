library(CompDist)


### Name: pcomp
### Title: pcomp
### Aliases: pcomp
### Keywords: Cumulative distribution function

### ** Examples
par<-list()

distvec<-c("lnorm","gamma")

par[[1]]<-c(0,1,Inf)

par[[2]]<-c(1)

par[[3]]<-c(0,1)

par[[4]]<-c(1,1)


x<-seq(0,3,0.01)

# non-continuous case

y1<-pcomp(x,distvec,par)

# continuous case

y2<-pcomp(x,distvec,par,borders=list(c(0.00001,10)),buffer=c(10e-5,0))


par(mfrow=c(1,2),oma=rep(0,4))

xrange<-range(x)

yrange<-range(y1,y2)

plot(x,y1,type="l",xlab="x",ylab="Distribution function",xlim=xrange,ylim=yrange)

abline(v=1,lty=2)

plot(x,y2,type="l",xlab="x",ylab="Distribution function",xlim=xrange,ylim=yrange)

abline(v=1,lty=2)


