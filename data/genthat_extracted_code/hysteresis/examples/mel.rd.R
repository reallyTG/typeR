library(hysteresis)


### Name: mel
### Title: Simulate (Make) an Ellipse
### Aliases: mel mel1 mel2 mel3 mel4
### Keywords: models

### ** Examples

ellipseA <- mel(method=3,cx=35, cy=39, ampx=7, ampy=2, lag=3, sd.x=0.2,sd.y=0.04)
 ellipseA.fit <- fel(ellipseA$x,ellipseA$y)
  plot(ellipseA.fit,xlab="Input",ylab="Output",main="Simulated Ellipse",
  putNumber=TRUE)
 boot.ellipseA.fit <- fel(ellipseA$x,ellipseA$y, boot=TRUE, seed=231)
  plot(boot.ellipseA.fit,xlab="Input",ylab="Output",
  main="Bootstrapped Ellipse",values="ellipse.all")

ellipse.eig <- mel(semi.major=7,semi.minor=4,rote.deg=30)
ellip.eigen.fit <- fel(ellipse.eig$x,ellipse.eig$y)
ellip.eigen.fit$Estimates
plot(ellip.eigen.fit,main="Ellipse from Eigenvalue Parameters",
show=c("semi.major","semi.minor","rote.deg"),values="ellipse")



