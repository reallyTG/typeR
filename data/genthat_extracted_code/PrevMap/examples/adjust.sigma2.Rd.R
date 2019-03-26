library(PrevMap)


### Name: adjust.sigma2
### Title: Adjustment factor for the variance of the convolution of
###   Gaussian noise
### Aliases: adjust.sigma2

### ** Examples

set.seed(1234)
# Observed coordinates
n <- 100
coords <- cbind(runif(n),runif(n))

# Spatial knots
knots <- expand.grid(seq(-0.2,1.2,length=5),seq(-0.2,1.2,length=5))

# Distance matrix
knots.dist <- as.matrix(pdist(coords,knots))

adjust.sigma2(knots.dist,0.1,2)




