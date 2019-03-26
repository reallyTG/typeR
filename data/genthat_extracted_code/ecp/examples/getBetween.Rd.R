library(ecp)


### Name: getBetween
### Title: GET BETWEEN DISTANCE
### Aliases: getBetween
### Keywords: internal

### ** Examples

set.seed(100)
X = matrix(rnorm(100),ncol=2)
Y = matrix(rnorm(126,1),ncol=2)
alpha = 1
between.distance = getBetween(alpha,X,Y)



