library(Rdistance)


### Name: simple.expansion
### Title: Calculate simple polynomial expansion for detection function
###   likelihoods
### Aliases: simple.expansion
### Keywords: models

### ** Examples

set.seed(883839)
  x <- rnorm(1000) * 100
  x <- x[ 0 < x & x < 100 ]
  simp.expn <- simple.expansion(x, 4)



