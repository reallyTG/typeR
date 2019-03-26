library(FSelector)


### Name: entropy.based
### Title: Entropy-based filters
### Aliases: information.gain gain.ratio symmetrical.uncertainty

### ** Examples

  data(iris)

  weights <- information.gain(Species~., iris)
  print(weights)
  subset <- cutoff.k(weights, 2)
  f <- as.simple.formula(subset, "Species")
  print(f)

  weights <- information.gain(Species~., iris, unit = "log2")
  print(weights)

  weights <- gain.ratio(Species~., iris)
  print(weights)
  subset <- cutoff.k(weights, 2)
  f <- as.simple.formula(subset, "Species")
  print(f)

  weights <- symmetrical.uncertainty(Species~., iris)
  print(weights)
  subset <- cutoff.biggest.diff(weights)
  f <- as.simple.formula(subset, "Species")
  print(f)




