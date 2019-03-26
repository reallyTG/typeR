library(spatstat)


### Name: intensity.psp
### Title: Empirical Intensity of Line Segment Pattern
### Aliases: intensity.psp
### Keywords: spatial nonparametric

### ** Examples

  S <- as.psp(simplenet)
  intensity(S)
  intensity(S, weights=runif(nsegments(S)))
  intensity(S, weights=expression((x0+x1)/2))



