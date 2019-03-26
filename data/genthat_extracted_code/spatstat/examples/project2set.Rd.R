library(spatstat)


### Name: project2set
### Title: Find Nearest Point in a Region
### Aliases: project2set
### Keywords: spatial math

### ** Examples

  He <- heather$fine[owin(c(2.8, 7.4), c(4.0, 7.8))]
  plot(He, main="project2set")
  X <- runifpoint(4, erosion(complement.owin(He), 0.2))
  points(X, col="red")
  Y <- project2set(X, He)
  points(Y, col="green")
  arrows(X$x, X$y, Y$x, Y$y, angle=15, length=0.2)



