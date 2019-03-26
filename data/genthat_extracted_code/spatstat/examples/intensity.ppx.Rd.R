library(spatstat)


### Name: intensity.ppx
### Title: Intensity of a Multidimensional Space-Time Point Pattern
### Aliases: intensity.ppx

### ** Examples

  X <- osteo$pts[[1]]
  intensity(X)
  marks(X) <- factor(sample(letters[1:3], npoints(X), replace=TRUE))
  intensity(X)



