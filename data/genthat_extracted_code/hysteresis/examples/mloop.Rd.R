library(hysteresis)


### Name: mloop
### Title: Simulate (Make) a Hysteresis Loop
### Aliases: mloop mloop2r
### Keywords: models

### ** Examples

#Simulate a loop with n=3, m=1, retention=0.9
loop1 <- mloop(cx=5,cy=8,retention=0.9,sd.x=0.01,sd.y=0.05,n=3,m=1)
loopmodel <- floop(loop1$x,loop1$y,n=3,m=1)
loopmodel 
##Plot hysteresis loop.
plot(loopmodel,main="Simulated Hysteresis Loop n=3 m=1",xlab="Input",
ylab="Output",values="hysteresis.all")




