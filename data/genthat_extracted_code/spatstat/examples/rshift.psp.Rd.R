library(spatstat)


### Name: rshift.psp
### Title: Randomly Shift a Line Segment Pattern
### Aliases: rshift.psp
### Keywords: spatial datagen

### ** Examples

  X <- psp(runif(20), runif(20), runif(20), runif(20),  window=owin())
  Y <- rshift(X, radius=0.1)



