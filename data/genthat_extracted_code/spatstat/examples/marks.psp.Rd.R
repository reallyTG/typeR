library(spatstat)


### Name: marks.psp
### Title: Marks of a Line Segment Pattern
### Aliases: marks.psp marks<-.psp
### Keywords: spatial manip

### ** Examples

  m <- data.frame(A=1:10, B=letters[1:10])
  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin(), marks=m)

  marks(X) 
  marks(X)[,2]
  marks(X) <- 42
  marks(X) <- NULL



