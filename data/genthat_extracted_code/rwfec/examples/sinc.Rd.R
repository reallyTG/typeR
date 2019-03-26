library(rwfec)


### Name: sinc
### Title: sinc
### Aliases: sinc

### ** Examples

x <- seq(-6*pi, 6*pi, by = pi/10)
p <- sinc(x)
plot(x/pi,p,ylim=c(-0.3,1.1), pch=19, cex=0.25, ylab="p", xlab="x*pi", type="l")
grid( col = "grey50", lty = "dotted")



