library(hysteresis)


### Name: plot.fittedloop
### Title: Plot a fitted ellipse or hysteresis loop.
### Aliases: plot.ellipsefit plot.ellipsesummary plot.ellipsefitlist
###   plot.ellipsesummarylist plot.fittedloop plot.fittedlooplist
###   plot.fittedlooplist2r plot.loopsummary plot.loopsummarylist
###   plot.loopsummarylist2r plot.loop2r plot.loop2rsummary
### Keywords: hplot

### ** Examples

##Fit and plot an ellipse
  ellipse1 <- mel(sd.x=0.2,sd.y=0.04)
  ellipse1.fit <- fel(ellipse1$x,ellipse1$y)
plot(ellipse1.fit,main="Simulated Ellipse",xlab="X Input",
ylab="Y Output",show=c("semi.major", "semi.minor"),values="ellipse.all")
### Bootstrapping
  booted.ellipse <- fel(ellipse1$x,ellipse1$y,boot=TRUE, seed=123)
plot(booted.ellipse,xlab="X Input",ylab="Y Output",
main="Simulated Bootstrap Ellipse",values="ellipse")

##Fit and plot a hysteresis loop
  loop1 <- mloop(sd.x=0.05,sd.y=0.05,n=5,m=3)
  loopmodel <- floop(loop1$x,loop1$y,n=5,m=3)
plot(loopmodel,main="Simulated Hysteresis Loop n=5 m=3",
xlab="Input",ylab="Output", values="hysteresis.all")
  booted.loop <- floop(loop1$x,loop1$y,,n=5,m=3,boot=TRUE, seed=1523)
plot(booted.loop,xlab="Input",ylab="Output",
main="Simulated Bootstrapped Loop n=5, m=3",putNumber=TRUE)
plot(booted.loop,main="Simulated Bootstrapped Loop n=5, m=3",
xlab="Input",ylab="Output",values="hysteresis.all")




