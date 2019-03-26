library(seewave)


### Name: mel
### Title: Hertz / Mel conversion
### Aliases: mel
### Keywords: math

### ** Examples

x<-seq(0,10000,by=50)
y<-mel(x)
plot(x,y,type="l",xlab = "f (hertz)", ylab = "f (mel)",
  main = "Mel scale", col="red")



