library(spatstat)


### Name: as.linnet.psp
### Title: Convert Line Segment Pattern to Linear Network
### Aliases: as.linnet.psp
### Keywords: spatial manip

### ** Examples

  # make some data
  A <- psp(0.09, 0.55, 0.79, 0.80, window=owin())
  B <- superimpose(A, as.psp(simplenet))

  # convert to a linear network
  D <- as.linnet(B)

  # check validity
  D
  plot(D)
  text(vertices(D), labels=vertexdegree(D))



