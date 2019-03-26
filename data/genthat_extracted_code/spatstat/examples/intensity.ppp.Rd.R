library(spatstat)


### Name: intensity.ppp
### Title: Empirical Intensity of Point Pattern
### Aliases: intensity.ppp intensity.splitppp
### Keywords: spatial nonparametric

### ** Examples

  japanesepines
  intensity(japanesepines)
  unitname(japanesepines)
  intensity(rescale(japanesepines))

  intensity(amacrine)
  intensity(split(amacrine))

  # numeric vector of weights
  volumes <- with(marks(finpines), (pi/4) * height * diameter^2)
  intensity(finpines, weights=volumes)

  # expression for weights
  intensity(finpines, weights=expression((pi/4) * height * diameter^2))



