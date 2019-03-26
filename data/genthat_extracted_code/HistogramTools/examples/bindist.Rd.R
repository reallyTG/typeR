library(HistogramTools)


### Name: HistogramDistance
### Title: Histogram Distance Measures
### Aliases: minkowski.dist intersect.dist kl.divergence jeffrey.divergence

### ** Examples

h1 <- hist(runif(100), plot=FALSE)
h2 <- hist(runif(100), plot=FALSE)

minkowski.dist(h1, h2, 1)
minkowski.dist(h1, h2, 2)
minkowski.dist(h1, h2, 3)
intersect.dist(h1, h2)
kl.divergence(h1, h2)
jeffrey.divergence(h1, h2)



