library(IPPP)


### Name: IPPPconddens
### Title: Conditional Probability Density Given the Location of one Event
### Aliases: IPPPconddens
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
#simulate the pdf of the event above the known event:
r1=IPPPconddens(x,pointlocation,xrate,yrate)
lines(r1$x,r1$densval,col="red",lwd=3)
#simulate the pdf of the event below the known event:
r2=IPPPconddens(x,pointlocation,xrate,yrate,mode="backward")
lines(r2$x,r2$densval,col="blue",lwd=3)
#simulate the pdf of the third event below the known event:
r2=IPPPconddens(x,pointlocation,xrate,yrate,mode="backward",nthpoint=3)
lines(r2$x,r2$densval,col="green",lwd=3)



