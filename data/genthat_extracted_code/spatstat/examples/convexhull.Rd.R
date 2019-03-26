library(spatstat)


### Name: convexhull
### Title: Convex Hull
### Aliases: convexhull
### Keywords: spatial utilities

### ** Examples

   data(demopat)
   W <- Window(demopat)
   plot(convexhull(W), col="lightblue", border=NA)
   plot(W, add=TRUE, lwd=2)



