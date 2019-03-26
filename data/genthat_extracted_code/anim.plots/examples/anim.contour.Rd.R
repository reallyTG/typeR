library(anim.plots)


### Name: anim.contour
### Title: Create an animated contour plot or perspective plot
### Aliases: anim.contour anim.filled.contour anim.filled.contour.default
###   anim.persp anim.contour.default

### ** Examples


tmp <- volcano
tmp[] <- 200 - ((row(tmp) - 43)^2 + (col(tmp) - 30)^2)/20
cplot <- array(NA, dim=c(87,61,20))
cplot[,,1] <- tmp
cplot[,,20] <- volcano
cplot <- apply(cplot, 1:2, function(x) seq(x[1], x[20], length.out=20))
cplot <- aperm(cplot, c(2,3,1))
anim.contour(z=cplot, times=1:20, speed=3, levels=80 + 1:12*10, lty=c(1,2,2))
anim.filled.contour(z=cplot, times=1:20, speed=3, levels=80 + 1:12*10, 
   color.palette=terrain.colors)
   
cplot2 <- apply(cplot, 1:2, function(x) seq(0, x[20], length.out=20))
cplot2 <- aperm(cplot2, c(2,3,1))
anim.persp(z=cplot2, times=1:20, xlab="", ylab="", zlab="Height", phi=45,
theta=30, speed=5, border=NA, r=3, col="yellowgreen", shade=.5, box=FALSE)
 



