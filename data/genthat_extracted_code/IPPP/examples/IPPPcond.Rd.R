library(IPPP)


### Name: IPPPcond
### Title: Simulate Location of Events for a Fixed Number of Events
### Aliases: IPPPcond
### Keywords: Poisson IPPP

### ** Examples

#define rate function
sx=1:5
sy=c(0,1,1,3,0)
sm=c(1,0,1,0,-1)
xrate=seq(1,5,length.out=100)
yrate=splinefunH(sx,sy,sm)(xrate)
#plot rate function
plot(xrate,yrate,type='l',xlim=c(0.5,5.5), main='Rate Function')
#simulate location of 5 events:
samplesize=5
p5=IPPPcond(samplesize,xrate,yrate) 
points(p5,rep(0,samplesize),cex=2) #plot results
#simulate location of 30 events
samplesize=30
p30=IPPPcond(samplesize,xrate,yrate) 
points(p30,rep(1,samplesize),cex=2,pch=3) #compare with former results



