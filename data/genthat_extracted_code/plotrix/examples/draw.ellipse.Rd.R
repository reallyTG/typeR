library(plotrix)


### Name: draw.ellipse
### Title: Draw ellipse
### Aliases: draw.ellipse
### Keywords: misc

### ** Examples

plot(c(0,10), c(0,10), type="n", main="test draw.ellipse")
draw.ellipse(c(3,7), c(8,8), c(0.5,1), c(1,0.5), col=c(2,4),
 angle=c(45,0), segment=rbind(c(0,45),c(45,360)))
draw.ellipse(c(3,7), c(6,6), c(0.5,1), c(1,0.5), col=c(2,4),
 angle=c(45,0), segment=rbind(c(0,45),c(45,360)), arc.only=FALSE)
draw.ellipse(c(3,7), c(4,4), c(0.5,1), c(1,0.5), border=c(2,4),
 angle=c(45,0), segment=rbind(c(0,45),c(45,360)), arc.only=FALSE)
draw.ellipse(c(3,7), c(2,2), c(0.5,1), c(1,0.5), border=1,
 angle=c(45,0), lty=3)
draw.ellipse(c(3,7), c(2,2), c(0.5,1), c(1,0.5), border=c(5,3),
 angle=c(45,0), nv=c(3,4), lty=2, lwd=2)



