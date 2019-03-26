library(spatstat)


### Name: psp
### Title: Create a Line Segment Pattern
### Aliases: psp
### Keywords: spatial datagen

### ** Examples

  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  m <- data.frame(A=1:10, B=letters[1:10])
  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin(), marks=m)



