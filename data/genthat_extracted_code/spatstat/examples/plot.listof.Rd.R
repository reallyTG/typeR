library(spatstat)


### Name: plot.listof
### Title: Plot a List of Things
### Aliases: plot.listof
### Keywords: spatial hplot

### ** Examples

# Intensity estimate of multitype point pattern
 plot(D <- density(split(amacrine)))
 plot(D, main="", equal.ribbon=TRUE,
      panel.end=function(i,y,...){contour(y, ...)})

# list of 3D point patterns
 ape1 <- osteo[osteo$shortid==4, "pts", drop=TRUE]
 class(ape1)
 plot(ape1, main.panel="", mar.panel=0.1, hsep=0.7, vsep=1,
      cex=1.5, pch=21, bg='white')



