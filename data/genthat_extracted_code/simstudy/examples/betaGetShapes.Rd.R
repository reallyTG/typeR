library(simstudy)


### Name: betaGetShapes
### Title: Convert beta mean and precision parameters to two shape
###   parameters
### Aliases: betaGetShapes

### ** Examples

set.seed(12345)
mean = 0.3; precision = 1.6
rs <- betaGetShapes(mean, precision)
c(rs$shape1, rs$shape2)
vec <- rbeta(1000, shape1 = rs$shape1, shape2 = rs$shape2)
(estMoments <- c(mean(vec), var(vec)))
(theoryMoments <- c(mean, mean*(1-mean)/(1+precision)))
(theoryMoments <- with(rs, c(shape1/(shape1 + shape2), 
  (shape1*shape2) / ((shape1 + shape2)^2*(1 + shape1 + shape2)))))



