library(FSelector)


### Name: cutoff
### Title: Cutoffs
### Aliases: cutoff.k cutoff.k.percent cutoff.biggest.diff

### ** Examples

  data(iris)

  weights <- information.gain(Species~., iris)
  print(weights)

  subset <- cutoff.k(weights, 1)
  f <- as.simple.formula(subset, "Species")
  print(f)

  subset <- cutoff.k.percent(weights, 0.75)
  f <- as.simple.formula(subset, "Species")
  print(f)

  subset <- cutoff.biggest.diff(weights)
  f <- as.simple.formula(subset, "Species")
  print(f)
  



