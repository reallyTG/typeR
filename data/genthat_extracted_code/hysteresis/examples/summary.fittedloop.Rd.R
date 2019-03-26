library(hysteresis)


### Name: summary.fittedloop
### Title: Summarizing and Bootstrapping Fitted Ellipses or Loops
### Aliases: summary.ellipsefit summary.fittedloop summary.loop2r
### Keywords: models

### ** Examples

#Loop example with circular block bootstrapping
loop1 <- mloop(n=1,m=2,sd.x=0.05,sd.y=0.05)
loop1.fit <- floop(loop1$x,loop1$y,m=2,n=1)
boot.loop1 <- summary(loop1.fit,cbb=3)
boot.loop1
plot(boot.loop1)

#Ellipse example.
ellipse1 <- mel(sd.x=0.2,sd.y=0.04)
ellipse1.fit <- fel(ellipse1$x,ellipse1$y)
boot.ellipse1.fit <- summary(ellipse1.fit)
boot.ellipse1.fit
plot(boot.ellipse1.fit,xlab="Input",ylab="Output",
main="Bootstrapped Ellipse",putNumber=TRUE)




