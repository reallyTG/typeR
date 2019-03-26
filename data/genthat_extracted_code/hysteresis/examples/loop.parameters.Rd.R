library(hysteresis)


### Name: loop.parameters
### Title: Inherent and Derived Parameter Definitions for Hysteresis
###   Loops/Ellipses
### Aliases: loop.parameters ellipse.parameters
### Keywords: models

### ** Examples

theloop<-mloop(sd.x=0.05,sd.y=0.05,n=2,m=3)
loopmodel<-floop(theloop$x,theloop$y,n=2,m=3)
loopmodel
plot(loopmodel,main="Hysteresis Loop n=2 m=3",values="hysteresis")

#Ellipse Parameters
ellipse.eig <- mel(semi.major=7,semi.minor=4,rote.deg=30)
ellip.eigen.fit <- fel(ellipse.eig$x,ellipse.eig$y)
ellip.eigen.fit$Estimates
plot(ellip.eigen.fit,main="Ellipse from Eigenvalue Parameters",
show=c("semi.major","semi.minor","rote.deg"),values="ellipse")



