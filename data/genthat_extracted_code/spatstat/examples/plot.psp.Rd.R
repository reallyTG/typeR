library(spatstat)


### Name: plot.psp
### Title: plot a Spatial Line Segment Pattern
### Aliases: plot.psp
### Keywords: spatial hplot

### ** Examples

  X <- psp(runif(20), runif(20), runif(20), runif(20), window=owin())
  plot(X)
  plot(X, lwd=3)
  lettuce <- sample(letters[1:4], 20, replace=TRUE)
  marks(X) <- data.frame(A=1:20, B=factor(lettuce))
  plot(X)
  plot(X, which.marks="B")
  plot(X, style="width", col="grey")



