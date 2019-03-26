library(spatstat)


### Name: rsyst
### Title: Simulate systematic random point pattern
### Aliases: rsyst
### Keywords: spatial datagen

### ** Examples

  X <- rsyst(nx=10)
  plot(X)

  # polygonal boundary
  data(letterR)
  X <- rsyst(letterR, 5, 10)
  plot(X)



