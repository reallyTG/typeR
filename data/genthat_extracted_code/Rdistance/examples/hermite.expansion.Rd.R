library(Rdistance)


### Name: hermite.expansion
### Title: Calculation of Hermite expansion for detection function
###   likelihoods
### Aliases: hermite.expansion
### Keywords: model

### ** Examples

set.seed(83828233)
  x <- rnorm(1000) * 100
  x <- x[0 < x & x < 100]
  herm.expn <- hermite.expansion(x, 3)



