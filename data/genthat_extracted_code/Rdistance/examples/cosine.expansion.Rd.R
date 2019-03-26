library(Rdistance)


### Name: cosine.expansion
### Title: calculation of cosine expansion for detection function
###   likelihoods
### Aliases: cosine.expansion
### Keywords: models

### ** Examples

set.seed(33328)
  x <- rnorm(1000) * 100
  x <- x[ 0 < x & x < 100 ]
  cos.expn <- cosine.expansion(x, 5)



