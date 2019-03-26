library(ecosim)


### Name: randou
### Title: Sample from an Ornstein-Uhlenbeck Process
### Aliases: randou

### ** Examples

n <- 10000
tau <- 0.1

proc1 <- randou(mean=0,sd=1,tau=tau,y0= 0,t=0:n/n,log=FALSE)
proc2 <- randou(mean=0,sd=1,tau=tau,y0= 1,t=0:n/n,log=FALSE)
proc3 <- randou(mean=0,sd=1,tau=tau,y0=-1,t=0:n/n,log=FALSE)
plot(proc1,xlim=c(0,1),ylim=c(-2.5,2.5),xlab="t",ylab="y",type="l")
lines(proc2,col="red")
lines(proc3,col="blue")
abline(h=0)
mean(proc1$y)
mean(proc2$y)
mean(proc3$y)
sd(proc1$y)
sd(proc2$y)
sd(proc3$y)

procl1 <- randou(mean=2,sd=2,tau=tau,y0=1,t=0:n/n,log=TRUE)
procl2 <- randou(mean=2,sd=2,tau=tau,y0=2,t=0:n/n,log=TRUE)
procl3 <- randou(mean=2,sd=2,tau=tau,y0=3,t=0:n/n,log=TRUE)
plot(procl1,xlim=c(0,1),ylim=c(0,6),xlab="t",ylab="y",type="l")
lines(procl2,col="red")
lines(procl3,col="blue")
mean(procl1$y)
mean(procl2$y)
mean(procl3$y)
sd(procl1$y)
sd(procl2$y)
sd(procl3$y)



