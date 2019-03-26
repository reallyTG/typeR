library(CharFun)


### Name: hypergeom1F1
### Title: Confluent hypergeometric function
### Aliases: hypergeom1F1

### ** Examples

## EXAMPLE1 (CF of Beta(1/2,1/2) distribution)
a  = 1 / 2
b  = 1 / 2
t  = seq(-50, 50, length.out = 2 ^ 11)
plotGraf(function(t)
  hypergeom1F1(1i * t, a, b + b), t,
  title = "CF of the Beta distribution with alpha = 1/2, beta = 1/2")



