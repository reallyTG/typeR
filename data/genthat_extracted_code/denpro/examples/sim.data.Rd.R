library(denpro)


### Name: sim.data
### Title: Generates data for illustrative purposes
### Aliases: sim.data
### Keywords: datagen

### ** Examples

d<-2
mixnum<-3
M<-matrix(0,mixnum,d)
M[1,]<-c(0,0)   
M[2,]<-c(4,0)  
M[3,]<-c(0,4)   
sig<-matrix(1,mixnum,d)
p0<-1/mixnum
p<-p0*rep(1,mixnum)
n<-100
dendat<-sim.data(type="mixt",n=n,M=M,sig=sig,p=p,seed=1)    
plot(dendat)

dendat<-sim.data(n=100)
plot(dendat)

N<-c(20,20)
pcf<-sim.data(N=N)
dp<-draw.pcf(pcf,pnum=c(30,30))
contour(dp$x,dp$y,dp$z,drawlabels=FALSE)

sim.data()

type="fox"
dendat<-sim.data(n=100,type=type)
plot(dendat)

pcf<-sim.data(N=N,type=type)
dp<-draw.pcf(pcf,pnum=c(30,30))
contour(dp$x,dp$y,dp$z,drawlabels=FALSE)




