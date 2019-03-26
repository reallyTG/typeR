library(lmomco)


### Name: parst3
### Title: Estimate the Parameters of the 3-Parameter Student t
###   Distribution
### Aliases: parst3
### Keywords: distribution (parameters) Distribution: Student t
###   (3-parameter)

### ** Examples

  parst3(vec2lmom(c(10,2,0,.1226)))$para
  parst3(vec2lmom(c(10,2,0,.14)))$para
  parst3(vec2lmom(c(10,2,0,0.2)))$para
  parst3(vec2lmom(c(10,2,0,0.4)))$para
  parst3(vec2lmom(c(10,2,0,0.9)))$para



