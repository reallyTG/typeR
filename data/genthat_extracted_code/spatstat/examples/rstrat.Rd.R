library(spatstat)


### Name: rstrat
### Title: Simulate Stratified Random Point Pattern
### Aliases: rstrat
### Keywords: spatial datagen

### ** Examples

  X <- rstrat(nx=10)
  plot(X)

  # polygonal boundary
  data(letterR)
  X <- rstrat(letterR, 5, 10, k=3)
  plot(X)



