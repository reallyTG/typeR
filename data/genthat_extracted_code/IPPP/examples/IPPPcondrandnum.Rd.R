library(IPPP)


### Name: IPPPcondrandnum
### Title: Generate Events Relative to a Known Event of an Inhomogeneous
###   Poisson Point Process
### Aliases: IPPPcondrandnum
### Keywords: Poisson IPPP

### ** Examples

#define rate function
xrate=seq(0,2*pi,length.out=1000)
yrate=sin(xrate)+1.01
plot(xrate,yrate,type="l",main="Rate Function")
#define known event:
pointlocation=3
lines(c(3,3),c(0,3),lwd=3)
#values where the density is calulated:
x=xrate
#simulate the next point above the known event:
p1=IPPPcondrandnum(pointlocation, xrate,yrate)
points(p1,0.5,pch=1,cex=2)
#simulate 10 times the next event below the known location:
p2=IPPPcondrandnum(pointlocation, xrate,yrate,no=10,mode="backward")
points(p2,rep(1,length(p2)),cex=2,pch=2)
#simulate the second point above the known event:
p3=IPPPcondrandnum(pointlocation, xrate,yrate,no=1,nthpoint=2)
points(p3,1.5,cex=2,pch=3) #might be out of the plot



