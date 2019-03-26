library(edcc)


### Name: contour.edcc
### Title: Contour plot of an "edcc" class object
### Aliases: contour.edcc

### ** Examples

x <- ecoXbar(h=seq(0.7,0.9,by=.01),L=seq(2.8,3.3,by=.01),n=4:6,P0=110,
P1=10,nlevels=50,contour.plot=TRUE)
contour(x,nlevels=20,lty=2,col=2,call.print=FALSE)



