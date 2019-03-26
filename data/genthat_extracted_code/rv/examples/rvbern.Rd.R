library(rv)


### Name: rvbern
### Title: Generate a Random Vector from a Bernoulli Sampling Model
### Aliases: rvbern
### Keywords: classes

### ** Examples


  rvbern(2, prob=0.5)
  rvbinom(2, size=1, prob=0.5) # Equivalent
  print(rvbern(1, 0.5, logical=TRUE)) # won't show the quantiles
  print(as.logical(rvbern(1, 0.5))) # equivalent




