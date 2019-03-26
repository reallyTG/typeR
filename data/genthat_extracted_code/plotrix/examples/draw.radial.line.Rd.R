library(plotrix)


### Name: draw.radial.line
### Title: Draw a radial line
### Aliases: draw.radial.line
### Keywords: misc

### ** Examples

 plot(0, xlim=c(1,5), ylim=c(1,5), main="Test of radial lines", xlab="", ylab="", type="n")
 points(3, 3, pch=20)
 draw.radial.line(1, 2, center=c(3,3))
 draw.radial.line(1, 2, center=c(3,3), angle=pi/4)
 draw.radial.line(1, 2, center=c(3,3), angle=pi/4+0.1, col="blue", lwd=4, lty=3)
 draw.radial.line(0.2, 1.2, center=c(3,3), deg=120, col="red", lwd=10)
 draw.radial.line(0.2, 1.2, center=c(3,3), deg=145, col="purple", lwd=10, lend=1)
 draw.radial.line(0.5, 2, center=c(3,3), deg=225, expand=TRUE, col="gold")
 draw.radial.line(0.7, 1.4, center=c(3,3), deg=180, expand=TRUE, col="orange", lwd=30)
 draw.radial.line(0.5, 1.5, center=c(3,3), deg=235, expand=TRUE, lwd=5, col="brown")
 draw.radial.line(0.1, 1.5, center=c(3,3), deg=325, expand=TRUE, lwd=5, col="green")



