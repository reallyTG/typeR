library(spatstat)


### Name: where.max
### Title: Find Location of Maximum in a Pixel Image
### Aliases: where.max where.min
### Keywords: spatial math

### ** Examples

   D <- distmap(letterR, invert=TRUE)
   plot(D)
   plot(where.max(D), add=TRUE, pch=16, cols="green")



