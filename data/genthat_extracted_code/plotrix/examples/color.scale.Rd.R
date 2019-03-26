library(plotrix)


### Name: color.scale
### Title: Turn values into colors.
### Aliases: color.scale
### Keywords: misc

### ** Examples

 # go from green through yellow to red with no blue
 x<-rnorm(20)
 y<-rnorm(20)
 # use y for the color scale
 plot(x,y,col=color.scale(y,c(0,1,1),c(1,1,0),0),main="Color scale plot",
  pch=16,cex=2)
 plot(1:10,rep(1:3,length.out=10),axes=FALSE,type="n",xlim=c(0,11),ylim=c(0,4),
  main="Test of RGB, HSV and HCL",xlab="",ylab="Color specification")
 axis(2,at=1:3,labels=c("HCL","HSV","RGB"))
 points(1:10,rep(1,10),pch=19,cex=8,col=color.scale(1:10,c(0,300),35,85,
  color.spec="hcl"))
 points(1:10,rep(2,10),pch=19,cex=8,col=color.scale(1:10,c(0,1),
  0.8,1,color.spec="hsv"))
 points(1:10,rep(3,10),pch=19,cex=8,col=color.scale(1:10,c(1,0.5,0),
  c(0,0.5,0),c(0,0,1),color.spec="rgb"))



