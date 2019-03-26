library(LongMemoryTS)


### Name: FI.sim
### Title: Simulate multivariate fractional white noise.
### Aliases: FI.sim

### ** Examples

T=1000
series<-FI.sim(T=T,q=2,rho=0.7,d=c(0.4,0.4))
ts.plot(series, col=1:2)
cor(series)

series<-FI.sim(T=T,q=2,rho=0,d=c(0.1,0.4), B=rbind(c(1,-1),c(0,1)))
ts.plot(series, col=1:2)



