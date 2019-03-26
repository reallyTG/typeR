library(icosa)


### Name: arcpoints
### Title: Calculation of points along an arc
### Aliases: arcpoints

### ** Examples

# empty plot
plot(NULL, NULL, xlim=c(-180, 180), ylim=c(-90,90))
# then endpoints of the arc
point1<-c(-45,-70)
point2<-c(130,65)
points(arcpoints(point1, point2, breaks=70, output="polar"))




