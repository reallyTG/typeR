library(IPPP)


### Name: IPPPnthpointdens
### Title: Probability Density of Events in an Inhomogeneous Poisson Point
###   Process
### Aliases: IPPPnthpointdens
### Keywords: Poisson IPPP

### ** Examples

sx=c(1,2,3,4,5)
sy=c(0,1,1,3,0)
sm=c(1,0,1,0,-1)
xrate=seq(1,5,length.out=100)
yrate=splinefunH(sx,sy,sm)(xrate)
#plot rate function
plot(xrate,yrate,type='l',xlim=c(0.5,5.5), main='Rate Function') 

x=seq(0,6,length.out = 1000) #point where the pdf is determined
n=1          #get the pdf of the first point from the left ...
samplesize=5  #... out of a sample of five
ll=IPPPnthpointdens(x,n,samplesize,xrate,yrate)
plot(ll$x,ll$densval,type='l') #plot the resulting pdf
legend('topleft',legend=paste('pdf of point no.',as.character(n),
'out of ',as.character(samplesize)), 'points' ,lty=1)



