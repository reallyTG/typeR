library(desire)


### Name: geometricDI
### Title: Geometric Mean Desirability Index
### Aliases: geometricDI
### Keywords: optimize multivariate

### ** Examples

h1 <- harrington1(-2, .9, 2, .1)
h2 <- harrington2(0, 2, 2)

di <- geometricDI(h1, h2, weights=c(1/3, 2/3))
di(c(0, 1))

## Desirability Index of vector input:
h <- harrington2(3,7,1)
g <- harrington1(-2, .1, 2, .9) 

d <- geometricDI(h, g, weights=c(0.5, 0.5))

m <- matrix(c(seq(2, 8, 0.1), seq(-2, 4, 0.1)), ncol=2, byrow=FALSE)
apply(m, 1, d) 



