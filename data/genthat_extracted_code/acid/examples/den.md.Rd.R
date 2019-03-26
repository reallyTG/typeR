library(acid)


### Name: den.md
### Title: Density for a Mixture of Income Distributions
### Aliases: den.md

### ** Examples

data(dist.para.t)
ygrid<-seq(0,20,by=0.1)#c(seq(0,1e5,by=100),seq(1.1e5,1e6,by=100000))
theta<-c(5,1,10,1.5)
p0<-0.2
p1<-0.3
p2<-0.5
n <-100000
y.sim <- ysample.md(n, "norm", "norm", theta, p0, p1, p2, dist.para.t)
den<-den.md(ygrid,"norm", "norm", theta, 
              p0, p1, p2, dist.para.table=dist.para.t)
hist(y.sim,freq=FALSE)
#hist(y.sim,breaks=c(seq(0,1e5,by=100),seq(1.1e5,1e6,by=100000)),xlim=c(0,2e4),ylim=c(0,0.001))
lines(ygrid,den,col=2)



