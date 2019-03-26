library(plotrix)


### Name: polar.plot
### Title: Plot values on a circular grid of 0 to 360 degrees
### Aliases: polar.plot
### Keywords: misc

### ** Examples

 testlen<-c(rnorm(36)*2+5)
 testpos<-seq(0,350,by=10)
 polar.plot(testlen,testpos,main="Test Polar Plot",lwd=3,line.col=4)
 oldpar<-polar.plot(testlen,testpos,main="Test Clockwise Polar Plot",
  radial.lim=c(0,15),start=90,clockwise=TRUE,lwd=3,line.col=4)
 # reset everything
 par(oldpar)



