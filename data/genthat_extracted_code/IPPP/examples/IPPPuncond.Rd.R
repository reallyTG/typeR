library(IPPP)


### Name: IPPPuncond
### Title: Simulate Events according to an Inhomogeneous Poisson Point
###   Process
### Aliases: IPPPuncond
### Keywords: Poisson IPPP

### ** Examples

#Define rate function
sx=1:5
sy=c(0,1,1,3,0)
sm=c(1,0,1,0,-1)
xrate=seq(1,5,length.out=100)
yrate=splinefunH(sx,sy,sm)(xrate)
#plot rate function
plot(xrate,yrate,type='l',xlim=c(0.5,5.5), main='Rate Function') 

p=IPPPuncond(xrate,yrate) #simulate one set of events
points(p,rep(0,length(p)),cex=2) #plot results
#simulate location of events with the expected number of events being 20
expsamplesize=20
pp=IPPPuncond(xrate,yrate,expsamplesize) 
length(pp) #in most cases, the result is not exactely 20
points(pp,rep(1,length(pp)),cex=2,pch=3) #compare with former results



