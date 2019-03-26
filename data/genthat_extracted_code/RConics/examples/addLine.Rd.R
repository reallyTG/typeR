library(RConics)


### Name: addLine
### Title: Add a "homogeneous" line to a plot.
### Aliases: addLine

### ** Examples

# two points in homogeneous coordinates
p1 <- c(3,1,1)
p2 <- c(0,2,1)

# homogeneous line joining p1 and p2
l_12 <- join(p1,p2)
l_12

# plot
plot(0,0,type="n", xlim=c(-2,5),ylim=c(-2,5),asp=1)
points(t(p1))
points(t(p2))
addLine(l_12,col="red",lwd=2)



