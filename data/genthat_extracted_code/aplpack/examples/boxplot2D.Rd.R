library(aplpack)


### Name: boxplot2D
### Title: Boxplot of projection of two dimensional data
### Aliases: boxplot2D
### Keywords: misc

### ** Examples

 xy<-cbind(1:100, (1:100)+rnorm(100,,5))
 par(pty="s")
 plot(xy,xlim=c(-50,150),ylim=c(-50,150))
 boxplot2D(xy,box.shift=-30,angle=3,angle.typ=1)
 boxplot2D(xy,box.shift=20,angle=1,angle.typ=1)
 boxplot2D(xy,box.shift=50,angle=5,angle.typ=1)
 par(pty="m")



