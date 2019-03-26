library(spatstat)


### Name: plot.solist
### Title: Plot a List of Spatial Objects
### Aliases: plot.solist
### Keywords: spatial hplot

### ** Examples

# Intensity estimate of multitype point pattern
 plot(D <- density(split(amacrine)))
 plot(D, main="", equal.ribbon=TRUE,
      panel.end=function(i,y,...){contour(y, ...)})



